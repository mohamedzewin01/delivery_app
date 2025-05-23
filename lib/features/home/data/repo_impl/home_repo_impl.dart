import 'package:delivery/core/common/api_result.dart';
import 'package:delivery/features/home/data/data_sources/home_data_source_repo.dart';
import 'package:delivery/features/home/domain/entities/home_entities.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repo/home_repo.dart';

@Injectable(as: HomeRepo)
class HomeRepoImpl implements HomeRepo {
 final HomeDataSourceRepo homeDataSourceRepo;

  HomeRepoImpl(this.homeDataSourceRepo);


  @override
  Future<Result<GetOrdersDeliveryEntity?>> getOrdersDelivery() {
 return homeDataSourceRepo.getOrdersDelivery();
  }


}
