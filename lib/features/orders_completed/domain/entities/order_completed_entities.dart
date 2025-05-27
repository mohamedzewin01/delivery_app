

import 'package:delivery/features/orders_completed/data/models/response/order_completed_dto.dart';

class OrderCompletedEntity {

  final String? message;

  final List<OrdersCompleted>? orders;

  OrderCompletedEntity ({
    this.message,
    this.orders,
  });


}