import 'package:json_annotation/json_annotation.dart';

part 'get_orders_delivery_request.g.dart';

@JsonSerializable()
class GetOrdersDeliveryRequest {
  @JsonKey(name: "drivers_id")
  final int? driversId;

  GetOrdersDeliveryRequest ({
    this.driversId,
  });

  factory GetOrdersDeliveryRequest.fromJson(Map<String, dynamic> json) {
    return _$GetOrdersDeliveryRequestFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$GetOrdersDeliveryRequestToJson(this);
  }
}


