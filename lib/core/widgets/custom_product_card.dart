import 'dart:io';
import 'dart:typed_data';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:fada_alhalij_web/core/di/di.dart';
import 'package:fada_alhalij_web/core/functions/is_user_logged_in.dart';
import 'package:fada_alhalij_web/core/resources/assets_manager.dart';
import 'package:fada_alhalij_web/core/resources/color_manager.dart';
import 'package:fada_alhalij_web/core/resources/style_manager.dart';
import 'package:fada_alhalij_web/core/resources/values_manager.dart';
import 'package:fada_alhalij_web/core/widgets/add_to_cart_button.dart';
import 'package:fada_alhalij_web/core/widgets/custom_elevated_button.dart';
import 'package:fada_alhalij_web/core/widgets/custom_text_form_field.dart';
import 'package:fada_alhalij_web/features/analytics/analytics_helper.dart';
import 'package:fada_alhalij_web/features/app_search/presentation/bloc/search_cubit.dart';
import 'package:fada_alhalij_web/features/auth/presentation/pages/auth_screen.dart';
import 'package:fada_alhalij_web/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:fada_alhalij_web/features/layout/presentation/cubit/layout_cubit.dart';
import 'package:fada_alhalij_web/features/products/data/models/products_model_response.dart';
import 'package:fada_alhalij_web/features/products/presentation/widgets/product_details.dart';
import 'package:fada_alhalij_web/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../features/auth/presentation/widgets/signup_form_view.dart';
import '../resources/cashed_image.dart';

class CustomProductCardWidget extends StatelessWidget {
  const CustomProductCardWidget({super.key, this.product});

  final ProductsRelations? product;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => getIt.get<CartCubit>(),
  child: BlocConsumer<CartCubit, CartState>(
      listener: (context, state) {
        if (state is CartAddLoading) {}
        if (state is CartAddSuccess) {

        }
        if (state is CartAddFail) {}
      },
      builder: (context, state) {
        return Material(
          child: GestureDetector(
            onTap: () {
              AnalyticsHelper.sendProductVisit(
                productId: product?.idProduct ?? 0,
              );
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (context) => ProductDetails(
                        product: product ?? ProductsRelations(),
                      ),
                ),
              );
              //   Navigator.pushReplacement(
              //   context,
              //   MaterialPageRoute(
              //     builder:
              //         (context) =>
              //         ProductDetails(product: product ?? ProductsRelations()),
              //   ),
              // );
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
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                                child: AspectRatio(
                                  aspectRatio: 2,
                                  child: Container(
                                    clipBehavior: Clip.antiAlias,
                                    decoration:
                                    BoxDecoration(borderRadius: BorderRadius.circular(12)),
                                    child: CustomImage(
                                      url: product?.imageCover ?? '',
                                      width: double.infinity,

                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 8),
                              Container(
                                alignment: Alignment.centerLeft,
                                child: AutoSizeText(
                                  product?.productPriceAfterDiscount != 0
                                      ? product?.productPriceAfterDiscount
                                              .toString() ??
                                          ''
                                      : product?.productPrice.toString() ?? '',
                                  style: TextStyle(
                                    color: Color(0xffFF324B),
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              product?.productPriceAfterDiscount == 0
                                  ? SizedBox(height: 10)
                                  : Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      AutoSizeText(
                                        product?.productPrice.toString() ?? '',
                                        style: TextStyle(
                                          decoration:
                                              TextDecoration.lineThrough,
                                          color: Get.theme.colorScheme.primary,
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(width: 8),
                                      AutoSizeText(
                                        "${product?.descount}%",
                                        style: TextStyle(
                                          color: Color.fromARGB(
                                            255,
                                            27,
                                            133,
                                            185,
                                          ),
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                              Container(
                                alignment: Alignment.center,
                                child: AutoSizeText(
                                  product?.productName ?? "????",
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: getSemiBoldStyle(
                                    color: ColorManager.black,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                              AutoSizeText(
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

                        product?.productPriceAfterDiscount == 0
                            ? SizedBox()
                            : Positioned(
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
                                    AutoSizeText(
                                      "${product?.descount}%",
                                      style: getSemiBoldStyle(
                                        color: ColorManager.white,
                                        fontSize: 14,
                                      ),
                                    ),
                                    AutoSizeText(
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

                    SizedBox(
                      height: 30,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ColorManager.pink,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              100,
                            ),
                          ),
                        ),
                        onPressed: () async {

                          showAuthOrAddToCartDialog(context, idProduct: product?.idProduct ?? 0);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              Assets.cart,
                              width: 15,
                              height: 15,
                              colorFilter: const ColorFilter.mode(
                                ColorManager.white,
                                BlendMode.srcIn,
                              ),
                            ),
                            const SizedBox(
                              width: AppSize.s8,
                            ),
                            Text(
                              "اضافة للسلة",
                              style: const TextStyle().copyWith(
                                color: ColorManager.white,
                                fontSize: AppSize.s12,
                                fontWeight: FontWeight.w500,
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
      },
    ),
);
  }
}

// class CustomProductCardWidget extends StatelessWidget {
//
//   const CustomProductCardWidget({
//     super.key,
//     // this.imgCover,
//     // this.title,
//     // this.priceAfterDiscount,
//     // this.price,
//     // required this.productId,
//     this.product,
//   });
//   final ProductsRelations? product;
//   // final int? productId;
//   // final String? imgCover;
//   // final String? title;
//   //
//   // final num? priceAfterDiscount;
//   // final num? price;
//
//   @override
//   Widget build(BuildContext context) {
//     // debugPrint(
//     //     "$productId =================================================================");
//     return IntrinsicHeight(
//       child: Container(
//         decoration: BoxDecoration(
//           borderRadius: const BorderRadius.all(Radius.circular(8)),
//           border: Border.all(color: ColorManager.primaryColor),
//         ),
//         child: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
//               child: AspectRatio(
//                 aspectRatio: 1,
//                 child: Container(
//                   clipBehavior: Clip.antiAlias,
//                   decoration:
//                   BoxDecoration(borderRadius: BorderRadius.circular(12)),
//                   child: CustomImage(
//                     url: product?.imageCover ?? '',
//                     width: double.infinity,
//
//                   ),
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(top: 13.5, left: 8, right: 8),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     product?.productName ?? '',
//                     maxLines: 1,
//                     overflow: TextOverflow.ellipsis,
//                     style: getRegularStyle(
//                         fontSize: AppSize.s12, color: ColorManager.black),
//                   ),
//                   Row(
//                     crossAxisAlignment: CrossAxisAlignment.end,
//                     children: [
//                       Text(
//                         "ريال",
//                         style: getBoldStyle(fontSize: AppSize.s14, color: ColorManager.orange),
//                       ),
//                       const SizedBox(
//                         width: AppSize.s5,
//                       ),
//                       Text(
//                         product?.productPriceAfterDiscount.toString()??'',
//                         style: getBoldStyle(fontSize: AppSize.s14, color: ColorManager.orange),
//                       ),
//                       const SizedBox(
//                         width: AppSize.s8,
//                       ),
//                       Text(
//                         product?.productPrice.toString()??'',
//                         style: getRegularStyle(
//                           fontSize: AppSize.s12,
//                           color: ColorManager.black,
//                           // textDecoration: TextDecoration.lineThrough,
//                         ),
//                       ),
//                       const SizedBox(
//                         width: AppSize.s8,
//                       ),
//                       Text(
//                         product?.productPriceAfterDiscount.toString()??'',
//
//                         style: getRegularStyle(
//                           fontSize: AppSize.s12,
//                           color: ColorManager.orange,
//                         ),
//                       ),
//                       Text(
//                         '%',
//                         style: getRegularStyle(
//                           fontSize: AppSize.s12,
//                           color: ColorManager.deepOrangeLight,
//                         ),
//                       ),
//                     ],
//                   )
//                 ],
//               ),
//             ),
//             const Spacer(),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 8),
//               child: AddToCartButton(
//                 productId: product?.idProduct ?? 0,
//               ),
//             ),
//             const Spacer(),
//           ],
//         ),
//       ),
//     );
//   }
// }