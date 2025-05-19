import 'package:fada_alhalij_web/core/resources/color_manager.dart';
import 'package:fada_alhalij_web/core/widgets/custom_product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/search_cubit.dart';

class GridProductSearch extends StatefulWidget {
  const GridProductSearch({Key? key}) : super(key: key);

  @override
  State<GridProductSearch> createState() => _GridProductSearchState();
}

class _GridProductSearchState extends State<GridProductSearch> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchSuccess) {
          var list = state.searchEntity.data ?? [];

          return SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 12,
              crossAxisSpacing: 16,
              mainAxisExtent: 260,
            ),
            delegate: SliverChildBuilderDelegate((context, index) {
              return CustomProductCardWidget(
                product: list[index].toProductsRelations(),
              );
            }, childCount: list.length),
          );
        } else if (state is SearchLoading) {
          return SliverToBoxAdapter(
            child: Center(
              child: CircularProgressIndicator(
                color: ColorManager.primaryColor,
              ),
            ),
          );
        } else if (state is SearchFailure) {
          return SliverToBoxAdapter(
            child: Center(child: Text("خطأ في التحميل: }")),
          );
        } else if (state is SearchLoading) {
          return SliverToBoxAdapter(
            child: Center(
              child: CircularProgressIndicator(
                color: ColorManager.primaryColor,
              ),
            ),
          );
        }
        return SliverToBoxAdapter(child: SizedBox.shrink());
      },
    );
  }
}
