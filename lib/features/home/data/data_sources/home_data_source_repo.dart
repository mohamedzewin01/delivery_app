import 'package:delivery/core/common/api_result.dart';
import 'package:delivery/features/home/domain/entities/home_entities.dart';

abstract class HomeDataSourceRepo {
  Future<Result<GetOrdersDeliveryEntity?>> getOrdersDelivery();
}
