

import 'package:bloc/bloc.dart';
import 'package:delivery/core/utils/cashed_data_shared_preferences.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import '../../../../core/common/api_result.dart';
import '../../domain/entities/home_entities.dart';
import '../../domain/use_cases/home_use_case.dart';

part 'home_state.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  final HomeUseCase _homeUseCase;

  HomeCubit(this._homeUseCase) : super(HomeInitial());

  static HomeCubit get(context) => BlocProvider.of(context);


}
