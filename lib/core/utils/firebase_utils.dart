import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivery/core/resources/app_constants.dart';
import 'package:delivery/features/home/data/models/response/get_orders_delivery.dart';

class FirebaseUtils {
  /// تهيئة الـ Collection مع Converter من وإلى كلاس Orders
  static CollectionReference<Orders> get ordersCollection {
    return FirebaseFirestore.instance
        .collection(AppConstants.collection)
        .withConverter<Orders>(
      fromFirestore: (snapshot, _) =>
          Orders.fromJson(snapshot.data()!),
      toFirestore: (order, _) => order.toJson(),
    );
  }

  /// إضافة طلب جديد
  static Future<void> addOrder(Orders order) async {
    try {
      await ordersCollection
          .doc(order.idOrder.toString()) // تأكد من أن idOrder موجود وفريد
          .set(order);
    } catch (e) {
      // من الأفضل التعامل مع الخطأ
      print("Error adding order: $e");
      rethrow; // أو تقدر ترجع Result أو bool حسب تصميمك
    }
  }
}
