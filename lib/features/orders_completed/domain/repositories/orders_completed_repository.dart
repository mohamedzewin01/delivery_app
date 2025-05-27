import 'package:delivery/core/common/api_result.dart';
import 'package:delivery/features/orders_completed/domain/entities/order_completed_entities.dart';

abstract class OrdersCompletedRepository {
  Future<Result<OrderCompletedEntity?>> getOrdersCompleted();

}
