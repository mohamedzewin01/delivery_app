import 'package:delivery/core/common/api_result.dart';
import 'package:delivery/features/home/domain/entities/home_entities.dart';
import 'package:delivery/features/home/domain/repo/home_repo.dart';


import 'package:injectable/injectable.dart';
import '../usecases/home_usecase_repo.dart';

@Injectable(as: HomeUseCaseRepo)
class HomeUseCase implements HomeUseCaseRepo {
  final HomeRepo repository;

  HomeUseCase(this.repository);

  @override
  Future<Result<GetOrdersDeliveryEntity?>> getOrdersDelivery() {
  return repository.getOrdersDelivery();
  }

  // Future<Result<T>> call(...) async {
  //   return await repository.get...();
  // }
}
