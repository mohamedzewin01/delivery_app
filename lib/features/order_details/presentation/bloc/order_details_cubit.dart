import 'package:bloc/bloc.dart';
import 'package:delivery/core/common/api_result.dart';
import 'package:delivery/features/order_details/data/models/request/updata_status_request.dart';
import 'package:delivery/features/order_details/domain/entities/order_details_entities.dart';
import 'package:delivery/features/order_details/domain/usecases/order_details_usecase_repo.dart';
import 'package:meta/meta.dart';
import 'package:injectable/injectable.dart';

part 'order_details_state.dart';

@injectable
class OrderDetailsCubit extends Cubit<OrderDetailsState> {
  OrderDetailsCubit(this._orderDetailsUseCaseRepo)
    : super(OrderDetailsInitial());
  final OrderDetailsUseCaseRepo _orderDetailsUseCaseRepo;

  Future<void> updateStatus({
    required String status,
    required int orderId,
  }) async {
    emit(OrderDetailsLoading());
    final result = await _orderDetailsUseCaseRepo.updateStatus(
      id: orderId,
      status: status,
    );
    switch (result) {
      case Success<OrderDetailsEntity?>():
        {
          if (!isClosed) {
            emit(OrderDetailsSuccess(result.data!));
          }
        }
        break;
      case Fail<OrderDetailsEntity?>():
        {
          if (!isClosed) {
            emit(OrderDetailsFailure(result.exception));
          }
        }
        break;
    }
  }
}
