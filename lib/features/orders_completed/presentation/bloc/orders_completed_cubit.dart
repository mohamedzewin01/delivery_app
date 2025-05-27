import 'package:bloc/bloc.dart';
import 'package:delivery/core/common/api_result.dart';
import 'package:delivery/features/orders_completed/domain/entities/order_completed_entities.dart';
import 'package:meta/meta.dart';
import 'package:injectable/injectable.dart';

import '../../domain/useCases/orders_completed_useCase_repo.dart';


part 'orders_completed_state.dart';

@injectable
class OrdersCompletedCubit extends Cubit<OrdersCompletedState> {
  OrdersCompletedCubit(this._ordersCompletedUseCaseRepo) : super(OrdersCompletedInitial());
  final OrdersCompletedUseCaseRepo _ordersCompletedUseCaseRepo;

  Future<void> getOrdersCompleted() async {
    emit(OrdersCompletedLoading());
    final result = await _ordersCompletedUseCaseRepo.getOrdersCompleted();
    switch (result) {
      case Success<OrderCompletedEntity?>():
        {
          if (!isClosed) {
            emit(OrdersCompletedSuccess(result.data!));
          }
        }
        break;
      case Fail():
        {
          if (!isClosed) {
            emit(OrdersCompletedFailure(result.exception));
          }
        }
        break;
    }
  }
}
