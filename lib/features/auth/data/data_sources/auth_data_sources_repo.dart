

import 'package:delivery/core/common/api_result.dart';
import 'package:delivery/features/auth/data/models/request/auth_request.dart';
import 'package:delivery/features/auth/domain/entities/auth_entities.dart';

abstract class AuthDataSourcesRepo {


  Future<Result<AuthSingInEntity?>>singIn(AuthRequest authRequest);


}