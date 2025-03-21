import 'package:flutter/material.dart';
import 'package:fada_alhalij_web/features/home/data/models/response/HomeModelResponseDto.dart';

import '../widgets/product_card.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ClipRect(
        child: GridView.builder(
          itemCount: 20,
          physics:
              BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            mainAxisExtent: 200,
          ),
          itemBuilder: (context, index) => ProductCard(
            product: Products(),
          ),
        ),
      ),
    );
  }
}
