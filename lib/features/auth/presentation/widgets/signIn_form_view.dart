
import 'package:delivery/core/resources/color_manager.dart';
import 'package:delivery/core/resources/routes_manager.dart';
import 'package:delivery/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({super.key, required this.viewModel});
  final AuthCubit viewModel;

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _formKey = GlobalKey<FormState>();
  bool _obscurePassword = true;
  bool _rememberMe = false;

  @override
  void initState() {
    super.initState();
    _rememberMe = widget.viewModel.rememberMe;
  }


  void _submit() {
    if (_formKey.currentState!.validate()) {
      // استدعاء API من خلال Cubit
      widget.viewModel.signIn();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccess) {
          Navigator.pushReplacementNamed(context, RoutesManager.layout);
        }
      },
      child:Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // حقل رقم الجوال
            _buildPhoneField(),

            SizedBox(height: 20),

            // حقل كلمة المرور
            _buildPasswordField(),

            SizedBox(height: 16),

            // خيار تذكرني
            _buildRememberMeCheckbox(),

            SizedBox(height: 24),

            // زر تسجيل الدخول
            _buildLoginButton(),
          ],
        ),
      )
    );
  }

  Widget _buildPhoneField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'رقم الجوال',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.grey[700],
          ),
        ),
        SizedBox(height: 8),
        Focus(
          onFocusChange: (hasFocus) {
            if (hasFocus && widget.viewModel.loginController.text.isEmpty) {
              widget.viewModel.loginController.text = '+966';
              widget.viewModel.loginController.selection = TextSelection.fromPosition(
                TextPosition(offset: widget.viewModel.loginController.text.length),
              );
            }
          },
          child: TextFormField(
            controller: widget.viewModel.loginController,
            textDirection: TextDirection.ltr,
            keyboardType: TextInputType.phone,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            decoration: InputDecoration(
              hintText: '+966 5XXXXXXXX',
              hintStyle: TextStyle(
                color: Colors.grey[400],
                fontSize: 14,
              ),
              prefixIcon: Container(
                margin: EdgeInsets.all(12),
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: ColorManager.primaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  Icons.phone_android,
                  color: ColorManager.primaryColor,
                  size: 20,
                ),
              ),
              filled: true,
              fillColor: Colors.grey[50],
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(
                  color: Colors.grey[200]!,
                  width: 1,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(
                  color: ColorManager.primaryColor,
                  width: 2,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(
                  color: Colors.red[300]!,
                  width: 1,
                ),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(
                  color: Colors.red,
                  width: 2,
                ),
              ),
              contentPadding: EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 16,
              ),
            ),
            onTap: () {
              if (!widget.viewModel.loginController.text.startsWith('+966')) {
                widget.viewModel.loginController.text = '+966';
                widget.viewModel.loginController.selection = TextSelection.fromPosition(
                  TextPosition(offset: widget.viewModel.loginController.text.length),
                );
              }
            },
            onChanged: (value) {
              if (!value.startsWith('+966')) {
                final cleaned = value.replaceAll(RegExp(r'[^\d]'), '');
                final newText = '+966${cleaned.replaceFirst(RegExp(r'^966*'), '').replaceFirst(RegExp(r'^0'), '')}';
                widget.viewModel.loginController.text = newText;
                widget.viewModel.loginController.selection = TextSelection.fromPosition(
                  TextPosition(offset: widget.viewModel.loginController.text.length),
                );
              } else {
                if (value.length > 4 && value[4] == '0') {
                  final newText = value.substring(0, 4) + value.substring(5);
                  widget.viewModel.loginController.text = newText;
                  widget.viewModel.loginController.selection = TextSelection.fromPosition(
                    TextPosition(offset: newText.length),
                  );
                }
              }

              if (widget.viewModel.loginController.text.length > 13) {
                final text = widget.viewModel.loginController.text.substring(0, 13);
                widget.viewModel.loginController.text = text;
                widget.viewModel.loginController.selection = TextSelection.fromPosition(
                  TextPosition(offset: text.length),
                );
              }
            },
            validator: (value) {
              if (value == null || value.trim().isEmpty || value == '+966') {
                return 'رقم الجوال مطلوب';
              }
              if (!value.startsWith('+966')) {
                return 'رقم الهاتف يجب أن يبدأ بـ +966';
              }
              if (value.length != 13) {
                return 'رقم الهاتف يجب أن يحتوي على 9 أرقام بعد +966';
              }
              return null;
            },
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'كلمة المرور',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.grey[700],
          ),
        ),
        SizedBox(height: 8),
        TextFormField(
          controller: widget.viewModel.passwordSignInController,
          textDirection: TextDirection.ltr,
          obscureText: _obscurePassword,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          decoration: InputDecoration(
            hintText: '••••••••',
            hintStyle: TextStyle(
              color: Colors.grey[400],
              fontSize: 14,
            ),
            prefixIcon: Container(
              margin: EdgeInsets.all(12),
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: ColorManager.primaryColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                Icons.lock_outline,
                color: ColorManager.primaryColor,
                size: 20,
              ),
            ),
            suffixIcon: IconButton(
              icon: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  _obscurePassword ? Icons.visibility_off : Icons.visibility,
                  color: Colors.grey[600],
                  size: 20,
                ),
              ),
              onPressed: () {
                setState(() {
                  _obscurePassword = !_obscurePassword;
                });
              },
            ),
            filled: true,
            fillColor: Colors.grey[50],
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(
                color: Colors.grey[200]!,
                width: 1,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(
                color: ColorManager.primaryColor,
                width: 2,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(
                color: Colors.red[300]!,
                width: 1,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(
                color: Colors.red,
                width: 2,
              ),
            ),
            contentPadding: EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 16,
            ),
          ),
          onFieldSubmitted: (value) {
            _submit();
          },
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'كلمة المرور مطلوبة';
            }
            if (value.length < 6) {
              return 'كلمة المرور يجب أن تكون 6 أحرف على الأقل';
            }
            return null;
          },
          textInputAction: TextInputAction.done,
        ),
      ],
    );
  }

  Widget _buildRememberMeCheckbox() {
    return InkWell(
      onTap: () {
        setState(() {
          _rememberMe = !_rememberMe;
          widget.viewModel.toggleRememberMe(_rememberMe);
        });
      },
      borderRadius: BorderRadius.circular(10),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 4),
        child: Row(
          children: [
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                color: _rememberMe
                    ? ColorManager.primaryColor
                    : Colors.transparent,
                border: Border.all(
                  color: _rememberMe
                      ? ColorManager.primaryColor
                      : Colors.grey[400]!,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(6),
              ),
              child: _rememberMe
                  ? Icon(
                Icons.check,
                size: 16,
                color: Colors.white,
              )
                  : null,
            ),
            SizedBox(width: 12),
            Text(
              'تذكرني',
              style: TextStyle(
                fontSize: 15,
                color: Colors.grey[700],
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLoginButton() {
    return Container(
      height: 56,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            ColorManager.primaryColor,
            ColorManager.primaryColor.withOpacity(0.8),
          ],
        ),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: ColorManager.primaryColor.withOpacity(0.3),
            blurRadius: 15,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: _submit,
          borderRadius: BorderRadius.circular(15),
          child: Container(
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'تسجيل الدخول',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(width: 8),
                Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                  size: 22,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}