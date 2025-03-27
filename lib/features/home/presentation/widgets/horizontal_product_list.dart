import 'package:fada_alhalij_web/core/widgets/custom_product_card.dart';
import 'package:flutter/material.dart';
import '../../data/models/response/home_model_response_dto.dart';

class BestDealsProductList extends StatelessWidget {
  const BestDealsProductList({super.key, required this.bestDeals});

  final List<ProductsBestDeals>? bestDeals;

  @override
  Widget build(BuildContext context) {
    List<ProductsBestDeals>? bestDeals10 =
        bestDeals?.take(10).toList();
    return GridView.builder(
      itemCount: bestDeals10?.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(parent: BouncingScrollPhysics()),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        mainAxisExtent: 220,
      ),
      itemBuilder: (context, index) => FittedBox(
        child: CustomProductCardWidget(
          product: bestDeals10?[index].toProductsRelations(),
        ),
      ),
      padding: EdgeInsets.symmetric(vertical: 8), // تأكد من إزالة أي padding
    );



      ListView.builder(
      // scrollDirection: Axis.horizontal,
      itemCount: bestDeals10?.length,
      itemBuilder: (context, index) {
        return FittedBox(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  CustomProductCardWidget(
                  product:bestDeals10?[index].toProductsRelations(),
                  ),
                  SizedBox(width: 8),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
