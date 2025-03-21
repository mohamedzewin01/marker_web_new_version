import 'package:flutter/material.dart';
import 'package:fada_alhalij_web/features/home/presentation/widgets/product_card_deal.dart';

import '../../data/models/response/HomeModelResponseDto.dart';

class BestDealsProductList extends StatelessWidget {
  const BestDealsProductList({super.key, required this.bestDeals});

  final List<Products> bestDeals;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: bestDeals.length,
      itemBuilder: (context, index) {
        return FittedBox(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  ProductCardWidget(product: bestDeals[index]),
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
