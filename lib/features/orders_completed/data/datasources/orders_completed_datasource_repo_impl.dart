import 'package:delivery/core/api/api_extentions.dart';
import 'package:delivery/core/common/api_result.dart';

import 'package:delivery/features/orders_completed/domain/entities/order_completed_entities.dart';

import 'orders_completed_datasource_repo.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/api/api_manager/api_manager.dart';

@Injectable(as: OrdersCompletedDatasourceRepo)
class OrdersCompletedDatasourceRepoImpl implements OrdersCompletedDatasourceRepo {
  final ApiService apiService;
  OrdersCompletedDatasourceRepoImpl(this.apiService);

  @override
  Future<Result<OrderCompletedEntity?>> getOrdersCompleted() {
   return executeApi(()async{
     var response = await apiService.getOrdersCompleted();
     return response?.toOrderCompletedEntity();
   });
  }
}
