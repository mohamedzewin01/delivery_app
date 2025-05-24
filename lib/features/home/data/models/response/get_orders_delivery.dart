import 'package:delivery/features/home/domain/entities/home_entities.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_orders_delivery.g.dart';

@JsonSerializable()
class GetOrdersDelivery {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "orders")
  final List<Orders>? orders;

  GetOrdersDelivery({this.message, this.orders});

  factory GetOrdersDelivery.fromJson(Map<String, dynamic> json) {
    return _$GetOrdersDeliveryFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$GetOrdersDeliveryToJson(this);
  }

  GetOrdersDeliveryEntity toGetOrdersDeliveryEntity() =>
      GetOrdersDeliveryEntity(message: message, orders: orders);
}

@JsonSerializable(explicitToJson: true)
class Orders {
  @JsonKey(name: "order_number")
  final String? orderNumber;
  @JsonKey(name: "id_order")
  final int? idOrder;
  @JsonKey(name: "status")
  final String? status;
  @JsonKey(name: "totalPrice")
  final double? totalPrice;
  @JsonKey(name: "order_date")
  final String? orderDate;
  @JsonKey(name: "delivery_time")
  final String? deliveryTime;
  @JsonKey(name: "is_active")
  final int? isActive;
  @JsonKey(name: "created_at")
  final String? createdAt;
  @JsonKey(name: "updated_at")
  final String? updatedAt;
  @JsonKey(name: "order_items")
  final List<OrderItems>? orderItems;
  @JsonKey(name: "user")
  final User? user;
  @JsonKey(name: "user_address")
  final UserAddress? userAddress;

  Orders({
    this.orderNumber,
    this.idOrder,
    this.status,
    this.totalPrice,
    this.orderDate,
    this.deliveryTime,
    this.isActive,
    this.createdAt,
    this.updatedAt,
    this.orderItems,
    this.user,
    this.userAddress,
  });

  factory Orders.fromJson(Map<String, dynamic> json) {
    return _$OrdersFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$OrdersToJson(this);
  }
}

@JsonSerializable()
class OrderItems {
  @JsonKey(name: "product_id")
  final int? productId;
  @JsonKey(name: "title")
  final String? title;
  @JsonKey(name: "price")
  final int? price;
  @JsonKey(name: "priceAfterDiscount")
  final int? priceAfterDiscount;
  @JsonKey(name: "discount")
  final int? discount;
  @JsonKey(name: "quantity")
  final int? quantity;
  @JsonKey(name: "totalPrice")
  final int? totalPrice;
  @JsonKey(name: "imgCover")
  final String? imgCover;

  OrderItems({
    this.productId,
    this.title,
    this.price,
    this.priceAfterDiscount,
    this.discount,
    this.quantity,
    this.totalPrice,
    this.imgCover,
  });

  factory OrderItems.fromJson(Map<String, dynamic> json) {
    return _$OrderItemsFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$OrderItemsToJson(this);
  }
}

@JsonSerializable()
class User {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "phone")
  final String? phone;
  @JsonKey(name: "email")
  final String? email;

  User({this.id, this.name, this.phone, this.email});

  factory User.fromJson(Map<String, dynamic> json) {
    return _$UserFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$UserToJson(this);
  }
}

@JsonSerializable()
class UserAddress {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "title")
  final String? title;
  @JsonKey(name: "street")
  final String? street;
  @JsonKey(name: "city")
  final String? city;
  @JsonKey(name: "lat")
  final String? lat;
  @JsonKey(name: "long")
  final String? long;
  @JsonKey(name: "details")
  final String? details;
  @JsonKey(name: "delivery_area_id")
  final int? deliveryAreaId;
  @JsonKey(name: "isActive")
  final int? isActive;
  @JsonKey(name: "created_at")
  final String? createdAt;

  UserAddress({
    this.id,
    this.title,
    this.street,
    this.city,
    this.lat,
    this.long,
    this.details,
    this.deliveryAreaId,
    this.isActive,
    this.createdAt,
  });

  factory UserAddress.fromJson(Map<String, dynamic> json) {
    return _$UserAddressFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$UserAddressToJson(this);
  }
}
