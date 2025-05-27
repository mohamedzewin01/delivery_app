

import 'package:json_annotation/json_annotation.dart';
part 'order_firebase_model.g.dart';


@JsonSerializable(explicitToJson: true)
class OrdersFirebaseModel {
  @JsonKey(name: "order_number")
  final String? orderNumber;
  @JsonKey(name: "id_order")
  final int? idOrder;
  @JsonKey(name: "status")
  final String? status;
  @JsonKey(name: "created_at")
  final String? createdAt;
  @JsonKey(name: "updated_at")
  final String? updatedAt;
  @JsonKey(name: "acceptedAt")
  final String? acceptedAt;
  @JsonKey(name: "preparingAt")
  final String? preparingAt;
  @JsonKey(name: "outDeliveryAt")
  final String? outDeliveryAt;
  @JsonKey(name: "delivery")
  final DeliveryFirebaseModel? delivery;


  OrdersFirebaseModel({
    this.orderNumber,
    this.idOrder,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.delivery,
    this.acceptedAt,
    this.preparingAt,
    this.outDeliveryAt
  });

  factory OrdersFirebaseModel.fromJson(Map<String, dynamic> json) {
    return _$OrdersFirebaseModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$OrdersFirebaseModelToJson(this);
  }
}



@JsonSerializable()
class DeliveryFirebaseModel {
  DeliveryFirebaseModel({
    this.name,
    this.phone,
    this.photo,
    this.idDelivery,
    this.lat,
    this.long,

  });

  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "phone")
  String? phone;
  @JsonKey(name: "photo")
  String? photo;
  @JsonKey(name: "lat")
  String? lat;
  @JsonKey(name: "long")
  String? long;
  @JsonKey(name: "id_driver")
  String? idDelivery;

  factory DeliveryFirebaseModel.fromJson(Map<String, dynamic> json) {
    return _$DeliveryFirebaseModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$DeliveryFirebaseModelToJson(this);
  }
}