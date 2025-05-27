import 'package:delivery/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:delivery/core/functions/helper.dart';

import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/style_manager.dart';
import '../../../../core/resources/values_manager.dart';
import '../../../../l10n/app_localizations.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onItemTapped,
  });

  final int currentIndex;
  final Function(int) onItemTapped;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorManager.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: BottomNavigationBar(
        elevation: 6,
        backgroundColor: ColorManager.primaryColor,


        items: [
          BottomNavigationBarItem(
            icon: buildIcon(Assets.homeSvg, 0, currentIndex),
            label: AppLocalizations.of(context)!.home,
          ),
          BottomNavigationBarItem(
            icon: buildIcon(Assets.categoriesSvg, 1, currentIndex),
            label: AppLocalizations.of(context)!.orders,
          ),

        ],
        selectedFontSize: AppSize.s14,
        selectedLabelStyle: getSemiBoldStyle(color: ColorManager.white),
        unselectedLabelStyle: getSemiBoldStyle(color: ColorManager.lightGrey2),
        currentIndex: currentIndex,
        onTap: onItemTapped,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: ColorManager.white,
      ),
    );
  }
}
