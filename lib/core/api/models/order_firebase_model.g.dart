// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_firebase_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrdersFirebaseModel _$OrdersFirebaseModelFromJson(Map<String, dynamic> json) =>
    OrdersFirebaseModel(
      orderNumber: json['order_number'] as String?,
      idOrder: (json['id_order'] as num?)?.toInt(),
      status: json['status'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      delivery: json['delivery'] == null
          ? null
          : DeliveryFirebaseModel.fromJson(
              json['delivery'] as Map<String, dynamic>,
            ),
      acceptedAt: json['acceptedAt'] as String?,
      preparingAt: json['preparingAt'] as String?,
      outDeliveryAt: json['outDeliveryAt'] as String?,
    );

Map<String, dynamic> _$OrdersFirebaseModelToJson(
  OrdersFirebaseModel instance,
) => <String, dynamic>{
  'order_number': instance.orderNumber,
  'id_order': instance.idOrder,
  'status': instance.status,
  'created_at': instance.createdAt,
  'updated_at': instance.updatedAt,
  'acceptedAt': instance.acceptedAt,
  'preparingAt': instance.preparingAt,
  'outDeliveryAt': instance.outDeliveryAt,
  'delivery': instance.delivery?.toJson(),
};

DeliveryFirebaseModel _$DeliveryFirebaseModelFromJson(
  Map<String, dynamic> json,
) => DeliveryFirebaseModel(
  name: json['name'] as String?,
  phone: json['phone'] as String?,
  photo: json['photo'] as String?,
  idDelivery: json['id_driver'] as String?,
  lat: json['lat'] as String?,
  long: json['long'] as String?,
);

Map<String, dynamic> _$DeliveryFirebaseModelToJson(
  DeliveryFirebaseModel instance,
) => <String, dynamic>{
  'name': instance.name,
  'phone': instance.phone,
  'photo': instance.photo,
  'lat': instance.lat,
  'long': instance.long,
  'id_driver': instance.idDelivery,
};
