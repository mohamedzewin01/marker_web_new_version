import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import '../common/api_result.dart';
import '../common/custom_exception.dart';

Future<Result<T>> executeApi<T>(Future<T> Function() apiCall) async {
  try {
    var result = await apiCall.call();
    return Success(result);
  } on TimeoutException catch (_) {
    return Fail(NoInternetError());
  } on DioException catch (ex) {
    // أولاً، قم بطباعة الخطأ للمساعدة في التصحيح
    print(ex.response?.data);

    // تحقق من وجود استجابة
    if (ex.response != null) {
      // استخراج الرسالة من الاستجابة أو استخدام رسالة افتراضية في حال عدم وجود رسالة
      String message = ex.response?.data['message'] ?? 'Unexpected error occurred';

      // إرجاع الكود مع الرسالة المناسبة
      return Fail(ServerError(
        ex.response?.statusCode, // الكود الحالة (مثل 400 أو 500)
        message, // الرسالة المستخرجة من الاستجابة
      ));
    } else {
      // في حال عدم وجود استجابة، إرجاع استثناء مختلف (DioHttpException)
      return Fail(DioHttpException(ex));
    }


  } on IOException catch (_) {
    return Fail(NoInternetError());
  } on Exception catch (ex) {
    return Fail(ex);
  }
}
