import 'package:delivery/features/orders_completed/domain/entities/order_completed_entities.dart';
import 'package:json_annotation/json_annotation.dart';

part 'order_completed_dto.g.dart';

@JsonSerializable()
class OrderCompletedDto {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "orders")
  final List<OrdersCompleted>? orders;

  OrderCompletedDto ({
    this.message,
    this.orders,
  });

  factory OrderCompletedDto.fromJson(Map<String, dynamic> json) {
    return _$OrderCompletedDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$OrderCompletedDtoToJson(this);
  }
  OrderCompletedEntity toOrderCompletedEntity() {
    return OrderCompletedEntity(
      message: message,
      orders: orders,
    );
  }
}

@JsonSerializable()
class OrdersCompleted {
  @JsonKey(name: "order_number")
  final String? orderNumber;
  @JsonKey(name: "id_order")
  final int? idOrder;
  @JsonKey(name: "status")
  final String? status;
  @JsonKey(name: "totalPrice")
  final int? totalPrice;
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

  OrdersCompleted ({
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
  });

  factory OrdersCompleted.fromJson(Map<String, dynamic> json) {
    return _$OrdersCompletedFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$OrdersCompletedToJson(this);
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

  OrderItems ({
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


