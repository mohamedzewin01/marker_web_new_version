import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:fada_alhalij_web/core/resources/cashed_image.dart';
import 'package:fada_alhalij_web/core/resources/color_manager.dart';

import '../../../../core/resources/assets_manager.dart';
import '../../../../models/dto/cart.dart';
import '../../../../views/common_widgets/appBar.dart';
import '../../data/models/response/HomeModelResponseDto.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key, required this.product});

  final Products product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: Text(product.nameProduct ?? ''),
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
          child: InkWell(
              customBorder:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              onTap: () {
                Navigator.pop(context);
              },
              child: SvgPicture.asset(Assets.imagesBack)),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 2,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.symmetric(vertical: 8),
                    decoration: BoxDecoration(
                        // gradient: LinearGradient(
                        //     colors: [
                        //       ColorManager.white,
                        //       ColorManager.white2,
                        //     ],
                        //     begin: Alignment.topCenter,
                        //     end: Alignment.bottomCenter),
                        // color: Colors.white,
                        border: Border(
                            bottom: BorderSide(
                                width: 4, color: ColorManager.primaryColor),
                            left: BorderSide(
                                width: .5, color: ColorManager.primaryColor),
                            right: BorderSide(
                                width: .5, color: ColorManager.primaryColor)),
                        borderRadius: BorderRadius.vertical(
                            bottom: Radius.elliptical(
                                MediaQuery.of(context).size.width, 140.0))),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: Hero(
                        tag: product.idProduct!,
                        child: CustomImage(
                          url: product.imageProduct ?? '',
                          width: 140,
                          height: 180,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "${product.priceNew ?? 0.00} SAR",
                          style: TextStyle(
                            color: Color(0xffFF324B),
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 14,
                        ),
                        Text(
                          product.nameProduct ?? "????",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        SizedBox(
                          height: 14,
                        ),
                        Text(
                          "Quantity : ${product.qunantity}",
                          style: TextStyle(
                            color: Get.theme.primaryColor,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 14,
                        ),
                        Text(
                          "tags: ${product.nameCategory}",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.normal),
                        ),
                        SizedBox(
                          height: 32,
                        ),
                        SizedBox(
                          height: 8,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Expanded(
          //   child: ListView.builder(
          //     scrollDirection: Axis.horizontal,
          //     shrinkWrap: true,
          //     itemCount: 5,
          //     itemBuilder: (context, index) =>
          //         CachedNetworkImage(
          //           imageUrl: product.imagefronturl ?? "",
          //           width: 140,
          //           height: 180,
          //           filterQuality: FilterQuality.low,
          //           errorWidget: (context, url, error) => Icon(Icons.error),
          //         ),
          //   ),
          // ),

          Expanded(
            flex: 0,
            child: Container(
              padding: const EdgeInsets.all(16.0),
              color: Get.theme.cardColor.withOpacity(0.6),
              child: Column(
                children: [
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      Column(
                        children: [
                          Text("Total price (with tax)",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              )),
                          SizedBox(
                            height: 4,
                          ),
                          Text("${product.priceNew ?? 10.00}",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold))
                        ],
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Expanded(
                        flex: 1,
                        child: _buildCartActions(CartItem(
                            id: '32',
                            imagefrontsmallurl: '232',
                            imagefronturl: 'imagefronturl',
                            productname: 'productname',
                            quantity: 'quantity',
                            price: 'price',
                            categories: 'categories',
                            itemQuantity: 3)),
                      )
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildCartNoActions() {
    return ElevatedButton(
      onPressed: () {
        // cartViewModel.addToCart(CartItem(
        //   id: product.id,
        //   productname: product.productname,
        //   price: product.price,
        //   quantity: product.quantity,
        //   itemQuantity: 1,
        //   imagefrontsmallurl: product.imagefrontsmallurl,
        //   imagefronturl: product.imagefronturl,
        //   categories: product.categories,
        // ));
      },
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 8),
        textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        shape: StadiumBorder(),
        backgroundColor: Get.theme.primaryColor,
      ),
      child: Text(
        "Add to cart",
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  Widget _buildCartActions(CartItem cartItem) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InkResponse(
          onTap: () {
            // cartViewModel.addToCart(cartItem);
          },
          child: Image.asset(
            Assets.imagesAddIcon,
            width: 40,
            height: 40,
          ),
        ),
        SizedBox(width: 20),
        Text(
          (cartItem.itemQuantity).toString(),
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(width: 20),
        InkResponse(
          onTap: () {
            // cartViewModel.removeFromCart(cartItem);
          },
          child: Image.asset(
            Assets.imagesRemoveIcon,
            width: 40,
            height: 40,
          ),
        ),
      ],
    );
  }
}
