
import 'package:delivery/core/common/api_result.dart';
import 'package:delivery/features/auth/data/models/request/auth_request.dart';
import 'package:delivery/features/auth/domain/entities/auth_entities.dart';
import 'package:delivery/features/auth/domain/repo/auth_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class AuthUseCase {
  final AuthRepo _authRepo;

  AuthUseCase(this._authRepo);
  Future<Result<AuthSingInEntity?>>singIn(AuthRequest authRequest){
    return _authRepo.singIn(authRequest);
  }

}
