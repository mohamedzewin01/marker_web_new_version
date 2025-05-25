

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fada_alhalij_web/core/resources/app_constants.dart';
import 'package:fada_alhalij_web/features/order/data/models/response/add_order_dto.dart' ;

class FirebaseUtils {
  /// تهيئة الـ Collection مع Converter من وإلى كلاس Orders
  static CollectionReference<AddOrderDto?> get ordersCollection {
    return FirebaseFirestore.instance
        .collection(AppConstants.collection)
        .withConverter<AddOrderDto>(
      fromFirestore: (snapshot, _) =>
          AddOrderDto.fromJson(snapshot.data()!),
      toFirestore: (order, _) => order.toJson(),
    );
  }

  /// إضافة طلب جديد
  static Future<void> addOrder(AddOrderDto? order) async {
    try {
      await ordersCollection
          .doc(order?.orderId.toString()) // تأكد من أن idOrder موجود وفريد
          .set(order);
    } catch (e) {
      // من الأفضل التعامل مع الخطأ
      print("Error adding order: $e");
      rethrow; // أو تقدر ترجع Result أو bool حسب تصميمك
    }
  }
}
