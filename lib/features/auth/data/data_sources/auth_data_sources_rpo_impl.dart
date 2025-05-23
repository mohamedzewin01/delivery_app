
import 'package:delivery/core/api/api_manager/api_manager.dart';

import 'package:injectable/injectable.dart';

import 'auth_data_sources_repo.dart';

@Injectable(as: AuthDataSourcesRepo)
class AuthDataSourcesRpoImpl implements AuthDataSourcesRepo {
  final ApiService _apiService;

  AuthDataSourcesRpoImpl(this._apiService);

}
