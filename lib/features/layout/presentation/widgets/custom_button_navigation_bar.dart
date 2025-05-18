import 'package:flutter/material.dart';
import 'package:fada_alhalij_web/core/functions/helper.dart';

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
        borderRadius: BorderRadius.only(topLeft: Radius.circular(16),topRight: Radius.circular(16)))
      ,
      child: BottomNavigationBar(
        // elevation: 6,
        backgroundColor: Colors.white,

        items: [
          BottomNavigationBarItem(
            icon: buildIcon(Assets.home2, 0, currentIndex),
            label: AppLocalizations.of(context)!.home,
          ),
          BottomNavigationBarItem(
            icon: buildIcon(Assets.categories2, 1, currentIndex),
            label: AppLocalizations.of(context)!.categories,
          ),
          BottomNavigationBarItem(
            icon: buildIcon(Assets.cart2, 2, currentIndex),
            label: AppLocalizations.of(context)!.cart,
          ),
          BottomNavigationBarItem(
            icon: buildIcon(Assets.search, 3, currentIndex),
            label: AppLocalizations.of(context)!.search,
          ),
          BottomNavigationBarItem(
            icon: buildIcon(Assets.settings, 4, currentIndex),
            label: AppLocalizations.of(context)!.user,
          ),
        ],
        selectedFontSize: AppSize.s14,
        selectedLabelStyle: getSemiBoldStyle(color: ColorManager.lightGrey2),
        unselectedLabelStyle: getSemiBoldStyle(color: ColorManager.lightGrey2),
        currentIndex: currentIndex,
        onTap: onItemTapped,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: ColorManager.primaryColor,
      ),
    );
  }
}
