import 'package:delivery/core/api/api_constants.dart';
import 'package:delivery/features/home/data/models/response/get_orders_delivery.dart';
import 'package:delivery/features/order_details/data/models/request/updata_status_request.dart';
import 'package:delivery/features/order_details/data/models/response/update_status_dto.dart';
import 'package:delivery/features/order_details/domain/entities/order_details_entities.dart';
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

  @POST(ApiConstants.orderStatus)
  Future<UpdateStatusDto?> updateOrderStatus(
      @Body() UpdateStatusRequest updateStatusRequest
      );

}

//  @MultiPart()
