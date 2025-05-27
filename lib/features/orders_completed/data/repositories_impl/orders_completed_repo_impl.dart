import 'package:delivery/core/common/api_result.dart';
import 'package:delivery/features/orders_completed/data/datasources/orders_completed_datasource_repo.dart';
import 'package:delivery/features/orders_completed/domain/entities/order_completed_entities.dart';
import 'package:injectable/injectable.dart';
import '../../domain/repositories/orders_completed_repository.dart';

@Injectable(as: OrdersCompletedRepository)
class OrdersCompletedRepositoryImpl implements OrdersCompletedRepository {
  final OrdersCompletedDatasourceRepo ordersCompletedDatasourceRepo;
  OrdersCompletedRepositoryImpl(this.ordersCompletedDatasourceRepo);
  @override
  Future<Result<OrderCompletedEntity?>> getOrdersCompleted() {
  return ordersCompletedDatasourceRepo.getOrdersCompleted();
  }
  // implementation
}
