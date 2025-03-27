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
    return BottomNavigationBar(
      elevation: 6,
      backgroundColor: ColorManager.white.withAlpha(240),
      items: [
        BottomNavigationBarItem(
          icon: buildIcon(Assets.home, 0, currentIndex),
          label: AppLocalizations.of(context)!.home,
        ),
        BottomNavigationBarItem(
          icon: buildIcon(Assets.categories, 1, currentIndex),
          label: AppLocalizations.of(context)!.category,
        ),
      ],
      selectedFontSize: AppSize.s14,
      selectedLabelStyle: getSemiBoldStyle(color: ColorManager.lightGrey2),
      unselectedLabelStyle: getSemiBoldStyle(color: ColorManager.lightGrey2),
      currentIndex: currentIndex,
      onTap: onItemTapped,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: ColorManager.black,
    );
  }
}
