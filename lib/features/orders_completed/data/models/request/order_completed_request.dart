import 'package:json_annotation/json_annotation.dart';

part 'order_completed_request.g.dart';

@JsonSerializable()
class OrderCompletedRequest {
  @JsonKey(name: "drivers_id")
  final int? driversId;

  OrderCompletedRequest ({
    this.driversId,
  });

  factory OrderCompletedRequest.fromJson(Map<String, dynamic> json) {
    return _$OrderCompletedRequestFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$OrderCompletedRequestToJson(this);
  }
}


