



import 'package:delivery/features/auth/data/models/response/auth_model.dart';

class AuthSingInEntity {
  final String? status;
  final String? message;
  final Driver? driver;

  AuthSingInEntity ({
    this.status,
    this.message,
    this.driver,
  });
}
