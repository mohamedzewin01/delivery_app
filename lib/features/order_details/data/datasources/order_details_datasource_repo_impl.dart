import 'package:delivery/core/api/api_extentions.dart';
import 'package:delivery/core/common/api_result.dart';

import 'package:delivery/features/order_details/data/models/request/updata_status_request.dart';

import 'package:delivery/features/order_details/domain/entities/order_details_entities.dart';

import 'order_details_datasource_repo.dart';
import 'package:injectable/injectable.dart';
import 'package:delivery/core/api/api_manager/api_manager.dart';

@Injectable(as: OrderDetailsDatasourceRepo)
class OrderDetailsDatasourceRepoImpl implements OrderDetailsDatasourceRepo {
  final ApiService _apiService;
  OrderDetailsDatasourceRepoImpl(this._apiService);

  @override
  Future<Result<OrderDetailsEntity?>> updateStatus(UpdateStatusRequest updateStatusRequest) {
  return executeApi(()async{
    var response = await _apiService.updateOrderStatus(updateStatusRequest);
    return response?.toOrderDetailsEntity();
  });
  }

}
