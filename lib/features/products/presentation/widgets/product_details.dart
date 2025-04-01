import 'dart:developer';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:fada_alhalij_web/core/functions/launch_url.dart';
import 'package:fada_alhalij_web/core/resources/cashed_image.dart';
import 'package:fada_alhalij_web/core/resources/color_manager.dart';
import 'package:fada_alhalij_web/core/resources/style_manager.dart';
import 'package:fada_alhalij_web/features/products/data/models/products_model_response.dart';
import 'package:fada_alhalij_web/features/products/presentation/cubit/products_cubit.dart';
import 'package:fada_alhalij_web/features/products/presentation/widgets/products_relation.dart';
import 'package:fada_alhalij_web/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/di/di.dart';
import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/curve_clipper.dart';
import '../../../../views/common_widgets/appBar.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key, required this.product});

  final ProductsRelations product;

  @override
  Widget build(BuildContext context) {
    debugPrint('Hero Tag: ${product.idProduct}');

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 2,
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  backgroundColor: ColorManager.indigoDark2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(4),
                    ),
                  ),
                  title: AutoSizeText(
                    ' ${PromotionalMessages.buyTwoGetThirdFree}  ${product.productName}' ??
                        '',
                    style: getSemiBoldStyle(
                      color: ColorManager.white,
                      fontSize: 20,
                    ),
                  ),
                  actions: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_forward_ios,
                        size: 22,
                        color: ColorManager.white,
                      ),
                    ),
                  ],
                  centerTitle: true,
                  floating: true,
                  snap: true,
                  automaticallyImplyLeading: false,
                  flexibleSpace: ClipPath(
                    clipper: InwardCurveClipper(),
                    child: Container(color: ColorManager.indigoDark),
                  ),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(
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
                ),
                SliverToBoxAdapter(
                  child: Padding(
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
                ),
              ],
            ),
          ),
          Expanded(
            flex: 0,

            child: Container(
              height: 50,
              color: ColorManager.indigoDark2,
              clipBehavior: Clip.none,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      children: [
                        Expanded(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "${product.productPriceAfterDiscount} ريال",
                                    style: getSemiBoldStyle(
                                      color: ColorManager.white,
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              ),
                                    Spacer(),
                              Container(
                                padding: EdgeInsets.all(8),
                                child: IconButton(
                                  onPressed: () {
                                    CustomLaunchUrl.launchUrlShareApp(
                                      title: product.productName ?? '',
                                      urlPreview: product.imageCover ?? '',
                                      details: product.description ?? '',
                                    );
                                  },
                                  icon: SvgPicture.asset(
                                    Assets.share,
                                    colorFilter: const ColorFilter.mode(
                                      Colors.white,
                                      BlendMode.srcIn,
                                    ),
                                    width: 20,
                                    height: 20,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
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
