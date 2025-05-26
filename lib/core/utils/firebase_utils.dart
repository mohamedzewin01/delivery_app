import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivery/core/resources/app_constants.dart';
import 'package:delivery/features/home/data/models/response/get_orders_delivery.dart';

class FirebaseUtils {
  static CollectionReference<Orders> get ordersCollection {
    return FirebaseFirestore.instance
        .collection(AppConstants.collection)
        .withConverter<Orders>(
          fromFirestore: (snapshot, _) => Orders.fromJson(snapshot.data()!),
          toFirestore: (order, _) => order.toJson(),
        );
  }

  static Future<void> addOrder(Orders order) async {
    try {
      await ordersCollection.doc(order.idOrder.toString()).set(order);
    } catch (e) {
      print("Error adding order: $e");
      rethrow;
    }
  }

  static Future<void> saveDriverInOrderData(
    String orderId,
    Delivery deliveryData,
  ) async {
    try {
      var document = FirebaseFirestore.instance
          .collection('OrdersInfo')
          .doc(orderId);
      await document.update({"delivery": deliveryData.toJson()});

      log('Order state updated successfully.');
    } catch (e) {
      log('Error updating order state: $e');
    }
  }

  static Future<Orders?> getOrderById(String orderId) async {
    try {
      final docSnapshot = await ordersCollection.doc(orderId).get();

      if (docSnapshot.exists) {
        return docSnapshot.data(); // بترجع instance من Orders
      } else {
        print("Order not found");
        return null;
      }
    } catch (e) {
      print("Error fetching order: $e");
      return null;
    }
  }

  static Future<void> updateOrderState({
    required String orderId,
    required OrderStateModel updatedData,
  }) async {
    try {
      var document = FirebaseFirestore.instance
          .collection('OrdersInfo')
          .doc(orderId);
      await document.update(updatedData.toJson());

      log('Order state updated successfully.');
    } catch (e) {
      log('Error updating order state: $e');
    }
  }
}

class OrderStateModel {
  String status;
  String updatedAt;
  String acceptedAt;
  String preparingAt;
  String outDeliveryAt;

  OrderStateModel({
    required this.status,
    required this.updatedAt,
    required this.acceptedAt,
    required this.preparingAt,
    required this.outDeliveryAt,
  });

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'updatedAt': updatedAt,
      'acceptedAt': acceptedAt,
      'preparingAt': preparingAt,
      'outDeliveryAt': outDeliveryAt,
    };
  }

  //'Pending',
  //     'Order Accepted',
  //     'Preparing',
  //     'Out for Delivery',
  //     'Delivered',

  factory OrderStateModel.fromJson(Map<String, dynamic> json) {
    return OrderStateModel(
      status: json['status'] as String,
      updatedAt: json['updatedAt'] as String,
      acceptedAt: json['acceptedAt'] as String,
      preparingAt: json['preparingAt'] as String,
      outDeliveryAt: json['outDeliveryAt'] as String
    );
  }
}
