import 'package:delivery/core/api/api_extentions.dart';
import 'package:delivery/core/api/api_manager/api_manager.dart';
import 'package:delivery/core/common/api_result.dart';
import 'package:delivery/features/auth/data/models/request/auth_request.dart';
import 'package:delivery/features/auth/domain/entities/auth_entities.dart';

import 'package:injectable/injectable.dart';

import 'auth_data_sources_repo.dart';

@Injectable(as: AuthDataSourcesRepo)
class AuthDataSourcesRpoImpl implements AuthDataSourcesRepo {
  final ApiService _apiService;

  AuthDataSourcesRpoImpl(this._apiService);

  @override
  Future<Result<AuthSingInEntity?>> singIn(AuthRequest authRequest) {
    return executeApi(() async {
      final result = await _apiService.loginDriver(authRequest);
      return result?.toEntity();
    });
  }
}
