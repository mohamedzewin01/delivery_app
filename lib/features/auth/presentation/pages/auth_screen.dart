import 'package:delivery/core/common/custom_exception.dart';
import 'package:delivery/core/di/di.dart';
import 'package:delivery/core/resources/assets_manager.dart';
import 'package:delivery/core/resources/color_manager.dart';
import 'package:delivery/core/utils/cashed_data_shared_preferences.dart';
import 'package:delivery/core/widgets/custom_dialog.dart';
import 'package:delivery/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:delivery/features/auth/presentation/widgets/signIn_form_view.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  late AuthCubit viewModel;
  bool isLogin = true;

  @override
  void initState() {
    viewModel = getIt.get<AuthCubit>();
    super.initState();
  }

  void toggleAuthMode() {
    setState(() {
      isLogin = !isLogin;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocProvider(
          create: (context) => viewModel,
          child: BlocListener<AuthCubit, AuthState>(
            listener: (context, state) {

            },
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.only(top: 45),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(0),
                color: ColorManager.primaryColor,
              ),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 4,
                  vertical: 16,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                  color: ColorManager.white,
                ),
                child: CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              clipBehavior: Clip.antiAlias,
                              padding: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                color: ColorManager.primaryColor,
                                shape: BoxShape.circle,
                              ),

                              child: Image.asset(
                                Assets.logo3,
                                width: 100,
                                height: 100,
                              ),
                            ),
                            SizedBox(height: 16 ,),
                               SignInForm(viewModel: viewModel),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
