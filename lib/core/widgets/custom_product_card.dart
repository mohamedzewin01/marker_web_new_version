import 'package:fada_alhalij_web/core/resources/color_manager.dart';
import 'package:fada_alhalij_web/core/resources/style_manager.dart';
import 'package:fada_alhalij_web/features/products/data/models/products_model_response.dart';
import 'package:fada_alhalij_web/features/products/presentation/widgets/product_details.dart';
import 'package:fada_alhalij_web/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../resources/cashed_image.dart';

class CustomProductCardWidget extends StatelessWidget {
  const CustomProductCardWidget({super.key, this.product});

  final ProductsRelations? product;

  @override
  Widget build(BuildContext context) {
    debugPrint('Hero Tag: ${product?.idProduct}');

    return Material(
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder:
                  (context) =>
                      ProductDetails(product: product ?? ProductsRelations()),
            ),
          );
        },
        child: Hero(
          tag: '${product?.idProduct}55',
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Color(0xffF1F1F5)),
              borderRadius: BorderRadius.circular(8),
            ),
            width: (MediaQuery.of(context).size.width / 2) - 34,
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      CustomImage(
                        url: product?.imageCover ?? '',
                        width: 110,
                        height: 110,
                      ),
                      SizedBox(height: 8),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          product?.productPriceAfterDiscount.toString() ?? '',
                          style: TextStyle(
                            color: Color(0xffFF324B),
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            product?.productPrice.toString() ?? '',
                            style: TextStyle(
                              decoration: TextDecoration.lineThrough,
                              color: Get.theme.colorScheme.primary,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 8),
                          Text(
                            "${product?.descount}%",
                            style: TextStyle(
                              color: Color.fromARGB(255, 27, 133, 185),
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          product?.productName ?? "????",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: getSemiBoldStyle(
                            color: ColorManager.black,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      Text(
                        product?.description ?? "",

                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: getSemiBoldStyle(
                          color: ColorManager.placeHolderColor2,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),

                Positioned(
                  top: 0, // to shift little up
                  left: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      color: ColorManager.error,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8),
                      ),
                    ),
                    padding: EdgeInsets.all(4),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "${product?.descount}%",
                          style: getSemiBoldStyle(
                            color: ColorManager.white,
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          AppLocalizations.of(context)!.discount,
                          style: getSemiBoldStyle(
                            color: ColorManager.white,
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
