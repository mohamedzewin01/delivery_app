
import 'package:delivery/core/di/di.dart';
import 'package:delivery/core/resources/color_manager.dart';
import 'package:delivery/core/resources/style_manager.dart';
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
    final size = MediaQuery.of(context).size;
    return Scaffold(
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
              child:SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: size.height * 0.008),

                      // الشعار والعنوان
                      Hero(
                        tag: 'app_logo',
                        child: Text("منارة امجاد",style:
                          getSemiBoldStyle(color: ColorManager.primaryColor,fontSize: 32),),
                      ),

                      SizedBox(height: 16),

                      Text(
                        'أهلاً بك',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: ColorManager.primaryColor,
                          shadows: [
                            Shadow(
                              color: Colors.black.withOpacity(0.1),
                              offset: Offset(0, 2),
                              blurRadius: 4,
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 8),

                      Text(
                        'سجل دخولك للمتابعة',
                        style: TextStyle(
                          fontSize: 16,
                          color:ColorManager.primaryColor.withOpacity(0.9),
                        ),
                      ),

                      SizedBox(height: size.height * 0.008),

                      // نموذج تسجيل الدخول
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        padding: EdgeInsets.all(24),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 30,
                              offset: Offset(0, 15),
                            ),
                          ],
                        ),
                        child: SignInForm(viewModel: viewModel),
                      ),

                      SizedBox(height: 30),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),);

  }
}
