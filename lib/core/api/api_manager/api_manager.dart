import 'package:delivery/core/api/api_constants.dart';
import 'package:delivery/features/home/data/models/response/get_orders_delivery.dart';
import 'package:dio/dio.dart';

import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'api_manager.g.dart';

@injectable
@singleton
@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ApiService {
  @FactoryMethod()
  factory ApiService(Dio dio) = _ApiService;

  @POST(ApiConstants.orderDelivery)
  Future<GetOrdersDelivery?> getOrdersDelivery();
}

//  @MultiPart()
