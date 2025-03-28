import 'package:fada_alhalij_web/core/di/di.dart';
import 'package:fada_alhalij_web/features/products/data/models/products_model_response.dart';
import 'package:fada_alhalij_web/features/products/presentation/cubit/products_cubit.dart';
import 'package:fada_alhalij_web/features/products/presentation/widgets/custom_product_card.dart';
import 'package:fada_alhalij_web/features/products/presentation/widgets/product_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
                state.productsModelEntity?.productsData?.productsRelations?.take(20).toList() ??
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
                shrinkWrap: true,
                // physics: NeverScrollableScrollPhysics(parent: BouncingScrollPhysics()),
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

                              child: CustomProductCard(
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