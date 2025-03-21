import 'package:fada_alhalij_web/core/resources/cashed_image.dart';
import 'package:flutter/material.dart';


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
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: Theme.of(context).cardColor,
          radius: 35,
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomImage(url: imagePath)),
        ),
        SizedBox(
          height: 4,
        ),
        Center(
          child: Text(
            catName,
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
            textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }
}
