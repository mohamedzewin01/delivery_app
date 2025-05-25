import 'package:delivery/core/api/api_extentions.dart';
import 'package:delivery/core/common/api_result.dart';
import 'package:delivery/features/home/domain/entities/home_entities.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/api/api_manager/api_manager.dart';
import 'home_data_source_repo.dart';

@Injectable(as: HomeDataSourceRepo)
class HomeDataSourceRepoImpl implements HomeDataSourceRepo {
 final ApiService apiService;

  HomeDataSourceRepoImpl(this.apiService);

  @override
  Future<Result<GetOrdersDeliveryEntity?>> getOrdersDelivery() {
   return executeApi(()async {
     var response = await apiService.getOrdersDelivery();
     return response?.toGetOrdersDeliveryEntity();
   },);
  }

}
