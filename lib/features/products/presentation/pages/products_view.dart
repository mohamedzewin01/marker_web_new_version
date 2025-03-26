import 'package:fada_alhalij_web/core/di/di.dart';
import 'package:fada_alhalij_web/core/widgets/custom_product_card.dart';
import 'package:fada_alhalij_web/features/products/data/models/products_model_response.dart';
import 'package:fada_alhalij_web/features/products/presentation/cubit/products_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ProductsView extends StatefulWidget {
  const ProductsView({super.key, required this.idCategory});

  final String? idCategory;

  @override
  State<ProductsView> createState() => _ProductsViewState();
}

class _ProductsViewState extends State<ProductsView> {
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

            List<ProductsRelations> productsList = products.reversed.toList();
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ClipRect(
                child: GridView.builder(
                  itemCount: productsList.length,
                  physics: BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics(),
                  ),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                    mainAxisExtent: 210,
                  ),
                  itemBuilder:
                      (context, index) =>
                          CustomProductCardWidget(product: productsList[index]),
                ),
              ),
            );
          }

          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
