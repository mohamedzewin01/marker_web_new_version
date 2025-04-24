import 'package:auto_size_text/auto_size_text.dart';
import 'package:fada_alhalij_web/core/resources/assets_manager.dart';
import 'package:fada_alhalij_web/core/resources/color_manager.dart';
import 'package:fada_alhalij_web/core/resources/curve_clipper.dart';
import 'package:fada_alhalij_web/core/resources/style_manager.dart';
import 'package:flutter/material.dart';

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar({
    super.key,
    required this.title,
    this.leading,
    this.actions, this.onPressed,
  });

  final String title;
  final Widget? leading;
  final List<Widget>? actions;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: ColorManager.pink,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(4)),
      ),
      title: AutoSizeText(
        title ?? '',
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: getSemiBoldStyle(color: ColorManager.white, fontSize: 16),
      ),
      centerTitle: true,
      floating: true,
      snap: true,
      automaticallyImplyLeading: false,
      flexibleSpace: ClipPath(
        clipper: InwardCurveClipper(),
        child: Container(color: ColorManager.pinkLight),
      ),
      leading:
      leading ??
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
                child: Image.asset(Assets.logo, scale: 1, fit: BoxFit.fill),
              ),
            ),
          ),

      actions:
      actions ??
          [
            IconButton(
              onPressed: onPressed,
              icon: Icon(
                Icons.arrow_forward_ios,
                size: 22,
                color: Colors.white,
              ),
            ),
          ],
    );
  }
}