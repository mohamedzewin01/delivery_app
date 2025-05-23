import 'package:delivery/core/common/api_result.dart';
import 'package:delivery/features/home/domain/entities/home_entities.dart';
import 'package:delivery/features/home/domain/repo/home_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeUseCase {
  HomeRepo homeRepo;

  HomeUseCase(this.homeRepo);

  Future<Result<HomeEntity?>> getHomeData() {
    return homeRepo.getHomeData();
  }
}
