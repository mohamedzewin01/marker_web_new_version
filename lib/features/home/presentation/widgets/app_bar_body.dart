import 'package:fada_alhalij_web/core/resources/style_manager.dart';
import 'package:flutter/material.dart';

import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/color_manager.dart';

class AppBarBody extends StatelessWidget {
  const AppBarBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title:  Text(
          'فضاء الخليج',
          style:getSemiBoldStyle(color: ColorManager.primaryColor,  fontSize: 18,)

      ),
      centerTitle: true,
      floating: true,
      snap: true,

      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Container(
            padding: EdgeInsets.all(1),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: ColorManager.placeHolderColor,
            ),
            child: CircleAvatar(
                backgroundColor: ColorManager.white,
                child: Image.asset(Assets.logo, scale: 1, fit: BoxFit.fill)),
          ),
        ),
      ],
    );
  }
}
