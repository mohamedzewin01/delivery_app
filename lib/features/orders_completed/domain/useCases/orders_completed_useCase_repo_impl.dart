import 'package:delivery/core/common/api_result.dart';

import 'package:delivery/features/orders_completed/domain/entities/order_completed_entities.dart';

import '../repositories/orders_completed_repository.dart';
import 'package:injectable/injectable.dart';
import '../useCases/orders_completed_useCase_repo.dart';

@Injectable(as: OrdersCompletedUseCaseRepo)
class OrdersCompletedUseCase implements OrdersCompletedUseCaseRepo {
  final OrdersCompletedRepository repository;

  OrdersCompletedUseCase(this.repository);

  @override
  Future<Result<OrderCompletedEntity?>> getOrdersCompleted() {
    return repository.getOrdersCompleted();
  }

  // Future<Result<T>> call(...) async {
  //   return await repository.get...();
  // }
}
