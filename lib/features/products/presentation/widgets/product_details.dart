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
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.symmetric(vertical: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.vertical(
                        bottom: Radius.elliptical(
                          MediaQuery.of(context).size.width,
                          140.0,
                        ),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: Hero(
                        tag: product.idProduct!,
                        child: CustomImage(
                          url: product.imageCover ?? '',
                          width: 140,
                          height: 180,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "${product.productPriceAfterDiscount ?? 0.00} SAR",
                          style: TextStyle(
                            color: Color(0xffFF324B),
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
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

                        SizedBox(height: 14),
                        Text(
                          "${AppLocalizations.of(context)?.category}: ${product.categoryName}",
                          style: getSemiBoldStyle(
                            color: ColorManager.primaryColor,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 32),
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
              padding: const EdgeInsets.all(16.0),
              color: ColorManager.primaryColor.withAlpha(100),
              child: Column(
                children: [
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Column(
                        children: [
                          Text(
                            "Total price (with tax)",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            "${product.productPriceAfterDiscount ?? 10.00}",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 8),
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
            products.removeWhere((element) => element.idProduct == widget.idProduct);
            return  SizedBox(
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
                            GestureDetector(child: CustomProductCardWidget(product: products[index],)),
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
