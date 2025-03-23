import 'package:cached_network_image/cached_network_image.dart';
import 'package:fada_alhalij_web/core/widgets/custom_riyal_saudi.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/api/api_constants.dart';
import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/style_manager.dart';
import '../../data/models/response/home_model_response_dto.dart';

class AllBestDealsView extends StatelessWidget {
  const AllBestDealsView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<ProductsBestDeals>? bestDeals = ModalRoute.of(context)?.settings.arguments as List<ProductsBestDeals>?;

    return Scaffold(
      // backgroundColor: Colors.orange,
      body: LayoutBuilder(
        builder: (context, constraints) {
          int crossAxisCount =
              constraints.maxWidth > 900
                  ? 5
                  : constraints.maxWidth > 700
                  ? 3
                  : 2;
          return CustomScrollView(
            slivers: [
              SliverGrid(
                delegate: SliverChildBuilderDelegate(
                  (context, index) => BestDealsItems(bestDeals: bestDeals?[index],),
                ),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  mainAxisExtent: 100,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class BestDealsItems extends StatelessWidget {
  const BestDealsItems({super.key, required this.bestDeals, });
  final ProductsBestDeals? bestDeals;
  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: (){},
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                border: Border.all(color: ColorManager.placeHolderColor),
                borderRadius: BorderRadius.circular(0)),
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    clipBehavior: Clip.antiAlias,
                    padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12),
                      ),
                    ),
                    child: AspectRatio(
                      aspectRatio: 16 / 9,
                      child: CachedNetworkImage(
                        imageUrl:
                        '${ApiConstants.baseUrlImage}${bestDeals?.imageCover}',
                        progressIndicatorBuilder:
                            (context, url, downloadProgress) => Skeletonizer(
                            child: Image.asset(
                              Assets.imagesImageDefault,
                            )),
                        errorWidget: (context, url, error) => Image.asset(
                          Assets.imagesImageDefault,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                ),
                Column(
                  children: [
                    Text(
                      'product.productName ?? ''',
                      overflow: TextOverflow.ellipsis,
                      textDirection: TextDirection.rtl,
                      style: getSemiBoldStyle(
                        color: ColorManager.black,
                        fontSize: 14,
                      ),
                      maxLines: 1,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text('',
                              textDirection: TextDirection.rtl,
                              maxLines: 1,
                              textAlign: TextAlign.right,
                              overflow: TextOverflow.ellipsis,
                              style: getSemiBoldStyle(
                                color: ColorManager.primary,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Divider(
                      color: ColorManager.placeHolderColor,
                    ),
                    IntrinsicHeight(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const CustomRiyalSaudi(
                                color: ColorManager.primary,
                                size: 12,
                              ),
                              const SizedBox(
                                width: 3,
                              ),
                              Text(
                                '30',
                                style: const TextStyle(
                                  color: ColorManager.primary,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                  decoration: TextDecoration.lineThrough,
                                  decorationColor: ColorManager.primary,
                                  decorationThickness: 2,
                                ),
                              ),
                            ],
                          ),
                          // product.productPrice != 0
                          //     ? VerticalDivider(
                          //   color: ColorManager.placeHolderColor,
                          // )
                          //     : SizedBox(),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CustomRiyalSaudi(),
                              const SizedBox(
                                width: 3,
                              ),
                              Text(
                                '55',
                                style: const TextStyle(
                                    fontWeight: FontWeight.w900,
                                    fontSize: 16,
                                    color: ColorManager.error),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),


        ],
      ),
    );
  }
}
