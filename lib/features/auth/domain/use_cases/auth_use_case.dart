
import 'package:delivery/features/auth/domain/repo/auth_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class AuthUseCase {
  final AuthRepo _authRepo;

  AuthUseCase(this._authRepo);


}
