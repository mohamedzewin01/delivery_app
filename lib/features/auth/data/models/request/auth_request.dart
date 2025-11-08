import 'package:json_annotation/json_annotation.dart';

part 'auth_request.g.dart';

@JsonSerializable()
class AuthRequest {
  @JsonKey(name: "phone")
  final String? phone;
  @JsonKey(name: "password")
  final String? password;

  AuthRequest ({
    this.phone,
    this.password,
  });

  factory AuthRequest.fromJson(Map<String, dynamic> json) {
    return _$AuthRequestFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$AuthRequestToJson(this);
  }
}


