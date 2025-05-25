// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'updata_status_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateStatusRequest _$UpdateStatusRequestFromJson(Map<String, dynamic> json) =>
    UpdateStatusRequest(
      idOrder: (json['id_order'] as num?)?.toInt(),
      status: json['status'] as String?,
    );

Map<String, dynamic> _$UpdateStatusRequestToJson(
  UpdateStatusRequest instance,
) => <String, dynamic>{'id_order': instance.idOrder, 'status': instance.status};
