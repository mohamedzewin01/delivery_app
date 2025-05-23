import 'package:bloc/bloc.dart';
import 'package:delivery/features/home/domain/usecases/home_usecase_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import '../../../../core/common/api_result.dart';
import '../../domain/entities/home_entities.dart';
import '../../domain/usecases/home_usecase_repo_impl.dart';

part 'home_state.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  final HomeUseCaseRepo _homeUseCase;


  HomeCubit(this._homeUseCase) : super(HomeInitial());

  static HomeCubit get(context) => BlocProvider.of(context);

  Future<void> getHomeData() async {
    emit(HomeLoading());
    final result = await _homeUseCase.getOrdersDelivery();
    switch (result) {
      case Success<GetOrdersDeliveryEntity?>():
        {
          if (!isClosed) {
            emit(HomeSuccess(result.data!));
          }
        }
      case Fail<GetOrdersDeliveryEntity?>():
        {
          emit(HomeFail(result.exception));
        }
    }
  }
}
