import 'package:fada_alhalij_web/core/resources/color_manager.dart';
import 'package:fada_alhalij_web/core/widgets/custom_product_card.dart';
import 'package:fada_alhalij_web/features/products/data/models/products_model_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/search_cubit.dart';

class GridProductSearch extends StatelessWidget {
  const GridProductSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchSuccess) {
          var list = state.searchEntity.data ?? [];
          return SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.69,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
            ),
            delegate: SliverChildBuilderDelegate(
                  (context, index) {
                return CustomProductCardWidget(product: list[index].toProductsRelations());
              },
              childCount: list.length,
            ),
          );
        }
        return SliverToBoxAdapter(
          child: Center(
            child: CircularProgressIndicator(color: ColorManager.primaryColor),
          ),
        );
      },
    );
  }
}
