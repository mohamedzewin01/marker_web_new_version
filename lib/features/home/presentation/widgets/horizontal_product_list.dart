import 'package:flutter/material.dart';
import 'package:fada_alhalij_web/features/home/presentation/widgets/product_card_deal.dart';
import '../../data/models/response/home_model_response_dto.dart';

class BestDealsProductList extends StatelessWidget {
  const BestDealsProductList({super.key, required this.bestDeals});

  final List<ProductsBestDeals>?  bestDeals;
  @override
  Widget build(BuildContext context) {
    List<ProductsBestDeals>?  bestDeals10=bestDeals?.reversed.take(10).toList();
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: bestDeals10?.length,
      itemBuilder: (context, index) {
        return FittedBox(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  ProductCardWidget(product: bestDeals10?[index]),
                  SizedBox(
                    width: 8,
                  )
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
