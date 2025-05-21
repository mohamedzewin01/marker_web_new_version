import 'package:fada_alhalij_web/core/api/api_constants.dart';
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
            '7987resized_1744890678567.jpeg',
            productPriceAfterDiscount: 0,
          ),
        ),
      ),
    );
  }
}
