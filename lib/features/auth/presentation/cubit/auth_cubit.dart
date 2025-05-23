import 'package:bloc/bloc.dart';
import 'package:delivery/core/common/api_result.dart';
import 'package:delivery/core/utils/cashed_data_shared_preferences.dart';
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

  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController loginController = TextEditingController();
  TextEditingController passwordSignInController = TextEditingController();


}


