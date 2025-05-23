import '../repositories/test_repository.dart';
import 'package:injectable/injectable.dart';
import '../usecases/test_usecase_repo.dart';

@Injectable(as: TestUseCaseRepo)
class TestUseCase implements TestUseCaseRepo {
  final TestRepository repository;

  TestUseCase(this.repository);

  // Future<Result<T>> call(...) async {
  //   return await repository.get...();
  // }
}
