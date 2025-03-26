import 'package:flutter/cupertino.dart';

import '../../../../core/widgets/categories_view.dart';
import '../../data/models/response/home_model_response_dto.dart';

class GridCategories extends StatelessWidget {
  const GridCategories({
    super.key,
    required this.categories,
  });

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
            crossAxisCount: 2,mainAxisSpacing: 4,crossAxisSpacing: 4),
        itemBuilder: (context, index) => CategoriesView(
            imagePath: categories[index].categoryImage ?? '',
            catName: categories[index].categoryName ?? ''),
      ),
    );
  }
}
