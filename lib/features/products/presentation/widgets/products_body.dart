import 'package:fada_alhalij_web/core/widgets/custom_product_card.dart';
import 'package:fada_alhalij_web/features/app_search/presentation/bloc/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

                ),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  mainAxisExtent: 250,
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