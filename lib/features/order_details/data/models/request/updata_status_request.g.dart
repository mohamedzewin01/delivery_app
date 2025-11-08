// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'updata_status_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateStatusRequest _$UpdateStatusRequestFromJson(Map<String, dynamic> json) =>
    UpdateStatusRequest(
      idOrder: (json['id_order'] as num?)?.toInt(),
      status: json['status'] as String?,
      driversId: (json['drivers_id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$UpdateStatusRequestToJson(
  UpdateStatusRequest instance,
) => <String, dynamic>{
  'id_order': instance.idOrder,
  'status': instance.status,
  'drivers_id': instance.driversId,
};
