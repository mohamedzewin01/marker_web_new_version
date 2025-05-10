import 'package:auto_size_text/auto_size_text.dart';
import 'package:fada_alhalij_web/core/functions/is_user_logged_in.dart';
import 'package:fada_alhalij_web/core/functions/launch_url.dart';
import 'package:fada_alhalij_web/core/resources/cashed_image.dart';
import 'package:fada_alhalij_web/core/resources/color_manager.dart';
import 'package:fada_alhalij_web/core/resources/style_manager.dart';
import 'package:fada_alhalij_web/core/widgets/rial_icon.dart';
import 'package:fada_alhalij_web/features/products/data/models/products_model_response.dart';
import 'package:fada_alhalij_web/features/products/presentation/widgets/products_relation.dart';
import 'package:fada_alhalij_web/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/curve_clipper.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key, required this.product});

  final ProductsRelations product;

  @override
  Widget build(BuildContext context) {
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
                  backgroundColor: ColorManager.pink.withAlpha(200),
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
                    child: Container(color: ColorManager.orange),
                  ),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Hero(
                        tag: '${product.idProduct}55',
                        child: Stack(
                          children: [
                            AspectRatio(
                              aspectRatio: 18 / 12,
                              child: CustomImage(url: product.imageCover ?? ''),
                            ),
                            Positioned(
                              right: 0,
                              bottom: 0,
                              child: IconButton(
                                onPressed: () {
                                  showAuthOrAddToCartDialog(
                                    context,
                                    idProduct: product.idProduct ?? 0,
                                  );
                                },
                                icon: Container(
                                  padding: EdgeInsets.all(7),
                                  margin: EdgeInsets.all(4),

                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: ColorManager.orange,
                                  ),
                                  child: Icon(
                                    size: 20,
                                    Icons.add,
                                    color: ColorManager.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              product.productPriceAfterDiscount == 0
                                  ? "${product.productPrice ?? 0.00}"
                                  : "${product.productPriceAfterDiscount ?? 0.00} ",
                              style: getSemiBoldStyle(
                                color: ColorManager.black,
                                fontSize: 24,
                              ),
                            ),
                            RialIcon(size: 24, color: ColorManager.black),
                          ],
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
                          padding: const EdgeInsets.symmetric(horizontal: 0),
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

                      ],
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child:  ProductsRelation(
                    idCategory: product.categoryId.toString(),
                    idProduct: product.idProduct,
                  ),
                )
              ],
            ),
          ),
          Expanded(
            flex: 0,

            child: Container(
              height: 50,
              color: ColorManager.pink.withAlpha(200),
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
                                    product.productPriceAfterDiscount == 0
                                        ? "${product.productPrice ?? 0.00} ريال "
                                        : "${product.productPriceAfterDiscount ?? 0.00} ريال ",
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
