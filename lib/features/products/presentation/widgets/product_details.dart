import 'dart:developer';

import 'package:fada_alhalij_web/core/functions/launch_url.dart';
import 'package:fada_alhalij_web/core/resources/cashed_image.dart';
import 'package:fada_alhalij_web/core/resources/color_manager.dart';
import 'package:fada_alhalij_web/core/resources/style_manager.dart';
import 'package:fada_alhalij_web/core/widgets/custom_product_card.dart';
import 'package:fada_alhalij_web/features/products/data/models/products_model_response.dart';
import 'package:fada_alhalij_web/features/products/presentation/cubit/products_cubit.dart';
import 'package:fada_alhalij_web/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/di.dart';
import '../../../../views/common_widgets/appBar.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key, required this.product});

  final ProductsRelations product;

  @override
  Widget build(BuildContext context) {
    debugPrint('Hero Tag: ${product.idProduct}');

    return Scaffold(
      appBar: MyAppBar(
        title: Text(product.productName ?? ''),
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
          child: InkWell(
            customBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            onTap: () {
              Navigator.pop(context);
            },
            // child: SvgPicture.asset(Assets.imagesBack)
          ),
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
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Hero(
                        tag: '${product.idProduct}55',
                        child: AspectRatio(
                          aspectRatio: 16 / 9,
                          child: CustomImage(url: product.imageCover ?? ''),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "${product.productPriceAfterDiscount ?? 0.00} ريال ",
                          style: TextStyle(
                            color: Color(0xffFF324B),
                            fontSize: 24,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        SizedBox(height: 14),
                        Text(
                          product.productName ?? "????",
                          style: getSemiBoldStyle(
                            color: ColorManager.primaryColor,
                            fontSize: 22,
                          ),
                        ),
                        SizedBox(height: 14),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            product.description ?? "????",
                            style: getSemiBoldStyle(
                              color: ColorManager.placeHolderColor2,
                              fontSize: 22,
                            ),
                          ),
                        ),
                        SizedBox(height: 14),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "${AppLocalizations.of(context)?.category}: ${product.categoryName}",
                            style: getSemiBoldStyle(
                              color: ColorManager.primaryColor,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        SizedBox(height: 16),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                ' منتج مشابة 🛍️',
                                style: getSemiBoldStyle(
                                  color: ColorManager.black,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                        ProductsRelation(
                          idCategory: product.categoryId.toString(),
                          idProduct: product.idProduct,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              color: ColorManager.primaryColor.withAlpha(100),
              child: Column(
                children: [
                  Row(
                    children: [
                      Column(
                        children: [
                          Text(
                            "السعر ",
                            style: getSemiBoldStyle(
                              color: ColorManager.black,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            "${product.productPriceAfterDiscount} ريال",
                            style: getSemiBoldStyle(
                              color: ColorManager.primaryColor,
                              fontSize: 26,
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      IconButton(
                        onPressed: () {
                          CustomLaunchUrl.launchUrlShare(
                            title: product.productName ?? '',
                            urlPreview: product.imageCover ?? '',
                            details: product.description ?? '',

                          ); //CustomLaunchUrl
                        },
                        icon: Icon(Icons.share, color: ColorManager.primaryColor),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProductsRelation extends StatefulWidget {
  const ProductsRelation({
    super.key,
    required this.idCategory,
    required this.idProduct,
  });

  final String? idCategory;
  final int? idProduct;

  @override
  State<ProductsRelation> createState() => _ProductsRelationState();
}

class _ProductsRelationState extends State<ProductsRelation> {
  late ProductsCubit viewModel;

  @override
  void initState() {
    viewModel = getIt<ProductsCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: viewModel..getProductsData(idCategory: widget.idCategory ?? ''),
      child: BlocBuilder<ProductsCubit, ProductsState>(
        builder: (context, state) {
          if (state is ProductsSuccess) {
            List<ProductsRelations> products =
                state.productsModelEntity?.productsData?.productsRelations ??
                [];
            products.removeWhere(
              (element) => element.idProduct == widget.idProduct,
            );
            return Container(
              padding: EdgeInsets.all(8),
              height: 210,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return FittedBox(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },

                              child: CustomProductCardWidget2(
                                product: products[index],
                              ),
                            ),
                            SizedBox(width: 8),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            );
          }
          return SizedBox();
        },
      ),
    );
  }
}

class CustomProductCardWidget2 extends StatelessWidget {
  const CustomProductCardWidget2({super.key, this.product});

  final ProductsRelations? product;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: GestureDetector(
        onTap: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder:
                  (context) =>
                      ProductDetails(product: product ?? ProductsRelations()),
            ),
          );
        },
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
                      width: 120,
                      height: 120,
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
                            color: ColorManager.primaryColor,
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
              // Positioned(
              //   bottom: 48,
              //   right: 0,
              //   child: Padding(padding: const EdgeInsets.all(8.0)),
              // ),
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
    );
  }
}
