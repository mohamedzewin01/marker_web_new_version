import 'package:fada_alhalij_web/core/resources/routes_manager.dart';
import 'package:fada_alhalij_web/features/home/presentation/widgets/best_deals_adaptive.dart';
import 'package:fada_alhalij_web/features/products/presentation/pages/products_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/categories_view.dart';
import '../../data/models/response/home_model_response_dto.dart';

class GridCategories extends StatelessWidget {
  const GridCategories({super.key, required this.categories});

  final List<Categories> categories;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      // color: ColorManager.primaryColor,
      child: GridView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        physics: BouncingScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 4,
          crossAxisSpacing: 4,
        ),
        itemBuilder:
            (context, index) => GestureDetector(
              onTap: () {

                Navigator.pushNamed(
                  context,
                  RoutesManager.categoriesAdaptive,
                  arguments: categories[index].categoryId,
                );

              },
              child: CategoriesView(
                imagePath: categories[index].categoryImage ?? '',
                catName: categories[index].categoryName ?? '',
              ),
            ),
      ),
    );
  }
}
