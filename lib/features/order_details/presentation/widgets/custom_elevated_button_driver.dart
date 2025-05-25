
import 'package:delivery/core/resources/color_manager.dart';
import 'package:delivery/core/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

class CustomElevatedButtonDriver extends StatelessWidget {
  const CustomElevatedButtonDriver({super.key, required this.onPressed,required this.title});

  final void Function() onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 22.0,
        left: 16.0,
        right: 16.0,
        top: 8.0,
      ),
      child: SizedBox(
        width: double.infinity,
        height: 50,
        child: CustomElevatedButton(
          buttonColor: ColorManager.primaryColor,
          title: title??'',
          onPressed: onPressed,
        ),
      ),
    );
  }
}