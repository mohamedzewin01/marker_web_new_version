import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fada_alhalij_web/features/home/presentation/widgets/product_detail.dart';

import '../../../../core/resources/cashed_image.dart';
import '../../../home/data/models/response/HomeModelResponseDto.dart';

class ProductCard extends StatelessWidget {
  final Products product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    log('${product.imageProduct}');
    return Material(
      child: GestureDetector(
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductDetailScreen(product: product),
            )),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Color(0xffF1F1F5)),
              borderRadius: BorderRadius.circular(8)),
          width: (MediaQuery.of(context).size.width / 2) - 34,
          child: Stack(children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  CustomImage(
                    url: product.imageProduct ?? '',
                    width: 120,
                    height: 120,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      product.priceOld.toString(),
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
                        product.priceNew.toString(),
                        style: TextStyle(
                            decoration: TextDecoration.lineThrough,
                            color: Get.theme.colorScheme.primary,
                            fontSize: 10,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        "${product.discount}55%",
                        style: TextStyle(
                            color: Color.fromARGB(255, 27, 133, 185),
                            fontSize: 10,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      product.nameProduct ?? "????",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 48,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
              ),
            ),
            Positioned(
              top: 0, // to shift little up
              left: 0,
              child: Container(
                  width: 40,
                  height: 40,
                  //color: Colors.amber.shade100,
                  decoration: BoxDecoration(
                      color: Color(0xffE9F5FA),
                      borderRadius:
                          BorderRadius.only(topLeft: Radius.circular(8))),
                  padding: EdgeInsets.all(8),
                  child: Column(
                    children: [
                      Text("${product.discount}%",
                          style: TextStyle(
                              fontSize: 8,
                              fontWeight: FontWeight.bold,
                              color: Get.theme.primaryColor)),
                      Text("OFF",
                          style: TextStyle(
                              fontSize: 8,
                              fontWeight: FontWeight.bold,
                              color: Get.theme.primaryColor))
                    ],
                  )),
            )
          ]),
        ),
      ),
    );
  }
}
