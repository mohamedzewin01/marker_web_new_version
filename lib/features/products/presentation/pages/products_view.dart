import 'package:fada_alhalij_web/core/di/di.dart';
import 'package:fada_alhalij_web/core/widgets/custom_product_card.dart';
import 'package:fada_alhalij_web/features/app_search/presentation/bloc/search_cubit.dart';
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
  void dispose() {
    viewModel.close();
    super.dispose();
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
            SearchCubit.get(context).searchProducts(products.reversed.toList());
            return ProductsBody();
          }

          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

class ProductsBody extends StatelessWidget {
  const ProductsBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ClipRect(
          child: BlocBuilder<SearchCubit, SearchState>(
            builder: (context, state) {
              return GridView.builder(
                itemCount:
                    SearchCubit.get(context).filteredProducts.length,
                physics: BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics(),
                ),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  mainAxisExtent: 220,
                ),
                itemBuilder:
                    (context, index) => CustomProductCardWidget(
                      product:
                          SearchCubit.get(
                            context,
                          ).filteredProducts[index],
                    ),
              );
            },
          ),
        ),
      ),
    );
  }
}
