
import 'package:fada_alhalij_web/core/resources/cashed_image.dart';
import 'package:fada_alhalij_web/core/resources/color_manager.dart';
import 'package:fada_alhalij_web/core/resources/style_manager.dart';
import 'package:flutter/material.dart';

import '../api/api_constants.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({
    super.key,
    required this.imagePath,
    required this.catName,
  });

  final String imagePath;
  final String catName;

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.pink,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Material(
            elevation: 4, // ارتفاع الظل
            shape: CircleBorder(), // يجعل الظل دائريًا
            child: CircleAvatar(
              backgroundImage: NetworkImage('${ApiConstants.baseUrlImage}$imagePath'),
              backgroundColor: ColorManager.white,
              radius: 25,
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: CustomImage(url: imagePath),
              ),
            ),
          ),

          SizedBox(height: 4),
          Center(
            child: FittedBox(
              fit: BoxFit.contain,
              child: Text(
                catName,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: getSemiBoldStyle(color: ColorManager.black, fontSize: 12),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
