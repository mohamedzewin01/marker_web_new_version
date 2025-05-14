import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import '../resources/style_manager.dart';
import '../resources/color_manager.dart';
import '../resources/values_manager.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton(
      {super.key,
      required this.buttonColor,
      required this.title,
      required this.onPressed,
      this.style,
      this.width});

  final Color buttonColor;
  final String title;
  final void Function() onPressed;
  final TextStyle? style;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor:buttonColor?? ColorManager.primaryColor,
        minimumSize: Size(width ?? 25, 33),
        // shape: const RoundedRectangleBorder(
        //   borderRadius: BorderRadius.all(Radius.circular(AppSize.s24)),
        // ),
      ),
      child: AutoSizeText(title,
          style: style ??
              getSemiBoldStyle(color: ColorManager.white, fontSize: 12)),
    );
  }
}
