import 'package:json_annotation/json_annotation.dart';

part 'auth_model.g.dart';

@JsonSerializable()
class AuthModel {
  @JsonKey(name: "status")
  final String? status;
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "driver")
  final Driver? driver;

  AuthModel ({
    this.status,
    this.message,
    this.driver,
  });

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return _$AuthModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$AuthModelToJson(this);
  }
}

@JsonSerializable()
class Driver {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "full_name")
  final String? fullName;
  @JsonKey(name: "phone")
  final String? phone;
  @JsonKey(name: "email")
  final String? email;
  @JsonKey(name: "license_number")
  final String? licenseNumber;
  @JsonKey(name: "vehicle_plate")
  final String? vehiclePlate;
  @JsonKey(name: "last_login")
  final String? lastLogin;

  Driver ({
    this.id,
    this.fullName,
    this.phone,
    this.email,
    this.licenseNumber,
    this.vehiclePlate,
    this.lastLogin,
  });

  factory Driver.fromJson(Map<String, dynamic> json) {
    return _$DriverFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$DriverToJson(this);
  }
}


