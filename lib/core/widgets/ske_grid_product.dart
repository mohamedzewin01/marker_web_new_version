import 'package:fada_alhalij_web/core/widgets/custom_product_card.dart';
import 'package:fada_alhalij_web/features/products/data/models/products_model_response.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SkeGridProduct extends StatelessWidget {
  const SkeGridProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 12,
          crossAxisSpacing: 16,
          mainAxisExtent: 260,
        ),
        itemCount: 6,
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder:
            (context, index) => CustomProductCardWidget(
          product: ProductsRelations(
            productName: 'aaaaaaaa',
            idProduct: 1,
            productPrice: 1,
            imageCover:
            'https://www.google.com/images/branding/googlelogo/2x/googlelogo_color_120x44dp.png',
            productPriceAfterDiscount: 0,
          ),
        ),
      ),
    );
  }
}
