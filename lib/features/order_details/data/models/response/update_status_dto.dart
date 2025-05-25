import 'package:delivery/features/order_details/domain/entities/order_details_entities.dart';
import 'package:json_annotation/json_annotation.dart';

part 'update_status_dto.g.dart';

@JsonSerializable()
class UpdateStatusDto {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "id_order")
  final int? idOrder;
  @JsonKey(name: "new_status")
  final String? newStatus;

  UpdateStatusDto ({
    this.message,
    this.idOrder,
    this.newStatus,
  });

  factory UpdateStatusDto.fromJson(Map<String, dynamic> json) {
    return _$UpdateStatusDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$UpdateStatusDtoToJson(this);
  }
  OrderDetailsEntity toOrderDetailsEntity() {
    return OrderDetailsEntity(
        message: message,
        idOrder: idOrder,
        newStatus: newStatus);
  }
}


