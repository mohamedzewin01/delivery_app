import 'package:bloc/bloc.dart';
import 'package:delivery/core/common/api_result.dart';
import 'package:delivery/core/utils/cashed_data_shared_preferences.dart';
import 'package:delivery/features/auth/data/models/request/auth_request.dart';
import 'package:delivery/features/auth/domain/entities/auth_entities.dart';
import 'package:delivery/features/auth/domain/use_cases/auth_use_case.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

@injectable
class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._authUseCase) : super(AuthInitial());
  final AuthUseCase _authUseCase;

  TextEditingController loginController = TextEditingController();
  TextEditingController passwordSignInController = TextEditingController();

  Future<void> signIn() async {
    emit(AuthLoading());
    final result = await _authUseCase.singIn(
      AuthRequest(
        login: loginController.text,
        password: passwordSignInController.text,
      ),
    );

    switch (result) {
      case Success<AuthSingInEntity?>():
        {
          if (!isClosed) {
            CacheService.setData(
              key: CacheKeys.userName,
              value: result.data?.driver?.fullName,
            );
            CacheService.setData(
              key: CacheKeys.userPhone,
              value: result.data?.driver?.phone,
            );
            CacheService.setData(
              key: CacheKeys.userEmail,
              value: result.data?.driver?.email,
            );

            emit(AuthSuccess(result.data!));
          }
        }
      case Fail<AuthSingInEntity?>():
        {
          emit(AuthFail(result.exception));
        }
    }
  }
}
