// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_completed_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderCompletedDto _$OrderCompletedDtoFromJson(Map<String, dynamic> json) =>
    OrderCompletedDto(
      message: json['message'] as String?,
      orders: (json['orders'] as List<dynamic>?)
          ?.map((e) => OrdersCompleted.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$OrderCompletedDtoToJson(OrderCompletedDto instance) =>
    <String, dynamic>{'message': instance.message, 'orders': instance.orders};

OrdersCompleted _$OrdersCompletedFromJson(Map<String, dynamic> json) =>
    OrdersCompleted(
      orderNumber: json['order_number'] as String?,
      idOrder: (json['id_order'] as num?)?.toInt(),
      status: json['status'] as String?,
      totalPrice: (json['totalPrice'] as num?)?.toInt(),
      orderDate: json['order_date'] as String?,
      deliveryTime: json['delivery_time'] as String?,
      isActive: (json['is_active'] as num?)?.toInt(),
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      orderItems: (json['order_items'] as List<dynamic>?)
          ?.map((e) => OrderItems.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$OrdersCompletedToJson(OrdersCompleted instance) =>
    <String, dynamic>{
      'order_number': instance.orderNumber,
      'id_order': instance.idOrder,
      'status': instance.status,
      'totalPrice': instance.totalPrice,
      'order_date': instance.orderDate,
      'delivery_time': instance.deliveryTime,
      'is_active': instance.isActive,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'order_items': instance.orderItems,
    };

OrderItems _$OrderItemsFromJson(Map<String, dynamic> json) => OrderItems(
  productId: (json['product_id'] as num?)?.toInt(),
  title: json['title'] as String?,
  price: (json['price'] as num?)?.toInt(),
  priceAfterDiscount: (json['priceAfterDiscount'] as num?)?.toInt(),
  discount: (json['discount'] as num?)?.toInt(),
  quantity: (json['quantity'] as num?)?.toInt(),
  totalPrice: (json['totalPrice'] as num?)?.toInt(),
  imgCover: json['imgCover'] as String?,
);

Map<String, dynamic> _$OrderItemsToJson(OrderItems instance) =>
    <String, dynamic>{
      'product_id': instance.productId,
      'title': instance.title,
      'price': instance.price,
      'priceAfterDiscount': instance.priceAfterDiscount,
      'discount': instance.discount,
      'quantity': instance.quantity,
      'totalPrice': instance.totalPrice,
      'imgCover': instance.imgCover,
    };
