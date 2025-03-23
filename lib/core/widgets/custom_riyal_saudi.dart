import 'package:flutter/material.dart';


import '../resources/assets_manager.dart';
import '../resources/color_manager.dart';

class CustomRiyalSaudi extends StatelessWidget {
  const CustomRiyalSaudi({super.key, this.color, this.size});

  final Color? color;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      Assets.imagesRial,
      height: size ?? 15,
      width: size ?? 15,
      color: color ?? ColorManager.error,
    );
  }
}
