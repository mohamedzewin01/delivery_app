import 'package:delivery/features/home/data/models/response/get_orders_delivery.dart';
import 'package:flutter/material.dart';

class OrderDetailsBody extends StatelessWidget {
  const OrderDetailsBody({
    super.key,
    required this.order,
  });

  final Orders? order;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('رقم الطلبية: ${order?.idOrder}'),

      ],
    );
  }
}