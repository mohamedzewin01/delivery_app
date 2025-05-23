

import 'package:delivery/core/common/api_result.dart';
import 'package:delivery/features/auth/data/data_sources/auth_data_sources_repo.dart';

import 'package:delivery/features/auth/domain/entities/auth_entities.dart';
import 'package:delivery/features/auth/domain/repo/auth_repo.dart';
import 'package:injectable/injectable.dart';


@Injectable(as: AuthRepo)
class AuthRepoImpl implements AuthRepo{
  final AuthDataSourcesRepo authDataSourcesRepo;

  AuthRepoImpl(this.authDataSourcesRepo);




}