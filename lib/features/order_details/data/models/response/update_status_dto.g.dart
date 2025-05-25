// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_status_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateStatusDto _$UpdateStatusDtoFromJson(Map<String, dynamic> json) =>
    UpdateStatusDto(
      message: json['message'] as String?,
      idOrder: (json['id_order'] as num?)?.toInt(),
      newStatus: json['new_status'] as String?,
    );

Map<String, dynamic> _$UpdateStatusDtoToJson(UpdateStatusDto instance) =>
    <String, dynamic>{
      'message': instance.message,
      'id_order': instance.idOrder,
      'new_status': instance.newStatus,
    };
