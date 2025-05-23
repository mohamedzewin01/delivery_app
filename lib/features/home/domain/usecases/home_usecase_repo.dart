import 'package:delivery/core/common/api_result.dart';
import 'package:delivery/features/home/domain/entities/home_entities.dart';

abstract class HomeUseCaseRepo {
  Future<Result<GetOrdersDeliveryEntity?>> getOrdersDelivery();
}
