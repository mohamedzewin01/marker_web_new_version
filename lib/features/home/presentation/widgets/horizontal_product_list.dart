import 'dart:developer';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:fada_alhalij_web/core/resources/color_manager.dart';
import 'package:fada_alhalij_web/core/resources/style_manager.dart';
import 'package:fada_alhalij_web/core/utils/cashed_data_shared_preferences.dart';
import 'package:fada_alhalij_web/core/widgets/custom_product_card.dart';
import 'package:flutter/material.dart';
import '../../data/models/response/home_model_response_dto.dart';

class BestDealsProductList extends StatelessWidget {
  const BestDealsProductList({super.key, required this.bestDeals});

  final List<ProductsBestDeals>? bestDeals;

  @override
  Widget build(BuildContext context) {
    List<ProductsBestDeals>? bestDeals10 = bestDeals ?? [];
    return LayoutBuilder(
      builder: (context, constraints) {
        double mainAxisExtent = (constraints.maxWidth > 500) ? 140 : 200;
        return bestDeals10.isNotEmpty
            ? SizedBox(
              height: 310,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                  itemCount: bestDeals10.length,
                  scrollDirection: Axis.horizontal,
                  // shrinkWrap: true,
                  // physics: NeverScrollableScrollPhysics(parent: BouncingScrollPhysics()),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    childAspectRatio: 0.80,
                    mainAxisExtent: mainAxisExtent,
                  ),
                  itemBuilder:
                      (context, index) => CustomProductCardWidget(
                        product: bestDeals10[index].toProductsRelations(),
                      ),
                  padding: EdgeInsets.symmetric(
                    vertical: 8,
                  ), // تأكد من إزالة أي padding
                ),
              ),
            )
            : Center(
              child: AutoSizeText(
                'جاري تجهز العروض ...',
                style: getSemiBoldStyle(color: ColorManager.red, fontSize: 16),
              ),
            );
      },
    );
  }
}

///
// SizedBox(
//   height: 220,
//   child:
//       bestDeals10.isNotEmpty
//           ? ListView.builder(
//             scrollDirection: Axis.horizontal,
//             itemCount: bestDeals10.length,
//             itemBuilder: (context, index) {
//
//               return FittedBox(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     Row(
//                       children: [
//                         CustomProductCardWidget(
//                           product: bestDeals10[index].toProductsRelations(),
//                         ),
//                         SizedBox(width: 8),
//                       ],
//                     ),
//                   ],
//                 ),
//               );
//             },
//           )
//           : Center(
//             child: AutoSizeText(
//               'جاري تجهز العروض ...',
//               style: getSemiBoldStyle(
//                 color: ColorManager.red,
//                 fontSize: 16,
//               ),
//             ),
//           ),
// );
