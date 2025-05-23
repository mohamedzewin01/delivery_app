
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/resources/color_manager.dart';
import '../../../../core/widgets/adaptive layout.dart';

import '../cubit/layout_cubit.dart';
import '../widgets/desktop.dart';
import '../widgets/mobile.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({super.key});

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {

  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: ColorManager.primaryColor,
        statusBarIconBrightness: Brightness.light,
      ),
    );
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LayoutCubit()),

      ],

      child: AdaptiveLayout(
        mobileLayout: (context) => const LayoutMobileView(),
        tabletLayout: (context) => const DesktopLayout(),
        desktopLayout: (context) => const Center(child: DesktopLayout()),
      ),
    );
  }
}
