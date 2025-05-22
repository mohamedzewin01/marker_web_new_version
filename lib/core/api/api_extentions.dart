// import 'dart:async';
// import 'dart:io';
// import 'package:dio/dio.dart';
// import '../common/api_result.dart';
// import '../common/custom_exception.dart';
//
// Future<Result<T>> executeApi<T>(Future<T> Function() apiCall) async {
//   try {
//     var result = await apiCall.call();
//     return Success(result);
//   } on TimeoutException catch (_) {
//     return Fail(NoInternetError());
//   } on DioException catch (ex) {
//     // أولاً، قم بطباعة الخطأ للمساعدة في التصحيح
//     print(ex.response?.data);
//
//
//     if (ex.response != null) {
//
//       String message = ex.response?.data['message'] ?? 'Unexpected error occurred';
//
//       // إرجاع الكود مع الرسالة المناسبة
//       return Fail(ServerError(
//         ex.response?.statusCode, // الكود الحالة (مثل 400 أو 500)
//         message, // الرسالة المستخرجة من الاستجابة
//       ));
//     } else {
//       // في حال عدم وجود استجابة، إرجاع استثناء مختلف (DioHttpException)
//       return Fail(DioHttpException(ex));
//     }
//
//
//   } on IOException catch (_) {
//     return Fail(NoInternetError());
//   } on Exception catch (ex) {
//     return Fail(ex);
//   }
// }
import 'dart:async';
import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import '../common/api_result.dart';
import '../common/custom_exception.dart';

Future<Result<T>> executeApi<T>(Future<T> Function() apiCall, {int retries = 3}) async {
  int attempt = 0;

  while (attempt < retries) {
    try {
      var connectivityResult = await Connectivity().checkConnectivity();
      if (connectivityResult == ConnectivityResult.none) {
        return Fail(NoInternetError(message: 'لا يوجد انترنت'));
      }

      var result = await apiCall.call();
      return Success(result);
    } on IOException catch (_) {

      attempt++;
      if (attempt >= retries) {
        return Fail(NoInternetError(message: 'لا يوجد انترنت'));
      }
      await Future.delayed(const Duration(seconds: 2));
    } on DioException catch (ex) {
      if (ex.response != null) {
        String message = ex.response?.data['message'] ?? 'حدث خطأ غير متوقع';
        return Fail(ServerError(
          ex.response?.statusCode,
          message,
        ));
      } else {

        attempt++;
        if (attempt >= retries) {
          return Fail(DioHttpException(ex));
        }
        await Future.delayed(const Duration(seconds: 2));
      }
    } on Exception catch (ex) {
      return Fail(ex);
    }
  }

  return Fail(Exception('فشل في تنفيذ العملية بعد المحاولات'));
}


class NoInternetError implements Exception {
  final String message;
  NoInternetError({this.message = 'لا يوجد انترنت'});

  @override
  String toString() => message;
}



class DioHttpException implements Exception {
  final DioException dioException;

  DioHttpException(this.dioException);

  @override
  String toString() {
    // تحقق من وجود رسالة في dioException
    final message = dioException.message ?? '';

    // رسائل خطأ محددة بناءً على نوع الخطأ أو نص الرسالة
    if (message.contains('Failed host lookup')) {
      return 'تعذر الاتصال بالخادم. يرجى التحقق من اتصال الإنترنت.';
    } else if (message.contains('Connection refused')) {
      return 'تم رفض الاتصال بالخادم.';
    } else if (message.contains('Connection timed out')) {
      return 'انتهت مهلة الاتصال بالخادم.';
    } else if (dioException.type == DioExceptionType.connectionTimeout) {
      return 'انتهت مهلة الاتصال بالخادم.';
    } else if (dioException.type == DioExceptionType.receiveTimeout) {
      return 'انتهت مهلة استقبال البيانات من الخادم.';
    } else if (dioException.type == DioExceptionType.sendTimeout) {
      return 'انتهت مهلة إرسال البيانات إلى الخادم.';
    } else if (dioException.type == DioExceptionType.badResponse) {
      return 'استجابة غير صحيحة من الخادم.';
    } else if (dioException.type == DioExceptionType.cancel) {
      return 'تم إلغاء الطلب.';
    } else if (dioException.type == DioExceptionType.unknown) {
      return 'حدث خطأ غير متوقع.';
    }

    // القيمة الافتراضية إن لم ينطبق شيء مما سبق
    return message.isNotEmpty ? message : 'حدث خطأ في الاتصال.';
  }
}


