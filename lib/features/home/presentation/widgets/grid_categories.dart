import 'package:flutter/cupertino.dart';

import '../../../../core/widgets/categories_view.dart';
import '../../data/models/response/HomeModelResponseDto.dart';

class GridCategories extends StatelessWidget {
  const GridCategories({
    super.key,
    required this.categories,
  });

  final List<Categories> categories;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 225,
      // color: ColorManager.primaryColor,
      child: GridView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, mainAxisExtent: 85),
        itemBuilder: (context, index) => CategoriesView(
            imagePath: categories[index].imageCategory ?? '',
            catName: categories[index].nameCategory ?? ''),
      ),
    );
  }
}
