import 'package:delivery/core/common/api_result.dart';
import 'package:delivery/core/utils/cashed_data_shared_preferences.dart';

import 'package:delivery/features/order_details/data/models/request/updata_status_request.dart';

import 'package:delivery/features/order_details/domain/entities/order_details_entities.dart';

import '../repositories/order_details_repository.dart';
import 'package:injectable/injectable.dart';
import '../usecases/order_details_usecase_repo.dart';

@Injectable(as: OrderDetailsUseCaseRepo)
class OrderDetailsUseCase implements OrderDetailsUseCaseRepo {
  final OrderDetailsRepository repository;

  OrderDetailsUseCase(this.repository);

  @override
  Future<Result<OrderDetailsEntity?>> updateStatus({required int id, required String status}) {

    int driversId =0;
    if(status=='Order Accepted'||status=='Order Delivered'||status=='Out for Delivery'||status=='Delivered'){
      driversId = CacheService.getData(key: CacheKeys.driversId) ?? 0;
    }

    UpdateStatusRequest updateStatusRequest = UpdateStatusRequest(
      idOrder: id,
      status: status,
      driversId: driversId,

    );
 return repository.updateStatus(updateStatusRequest);
  }


}
