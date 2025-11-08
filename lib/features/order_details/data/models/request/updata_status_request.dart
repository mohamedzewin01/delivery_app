import 'package:json_annotation/json_annotation.dart';

part 'updata_status_request.g.dart';

@JsonSerializable()
class UpdateStatusRequest {
  @JsonKey(name: "id_order")
  final int? idOrder;
  @JsonKey(name: "status")
  final String? status;
  @JsonKey(name: "drivers_id")
  final int? driversId;

  UpdateStatusRequest ({
    this.idOrder,
    this.status,
    this.driversId,
  });

  factory UpdateStatusRequest.fromJson(Map<String, dynamic> json) {
    return _$UpdateStatusRequestFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$UpdateStatusRequestToJson(this);
  }
}


