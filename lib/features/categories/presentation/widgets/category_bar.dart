import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/style_manager.dart';
import '../../../../core/resources/values_manager.dart';
import '../../../products/presentation/pages/products_view.dart';
import '../../data/models/categories_zone_response.dart';
import '../cubit/categories_cubit.dart';

class CategoryBar extends StatefulWidget {
  const CategoryBar({
    super.key,
    required this.viewModel,
  });

  final CategoriesCubit viewModel;

  @override
  State<CategoryBar> createState() => _CategoryBarState();
}

class _CategoryBarState extends State<CategoryBar> {
  int indexTab = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesCubit, CategoriesState>(
      builder: (context, state) {
        if (state is CategoriesSuccess) {
          List<CategoriesZone>? categoriesZone =
              state.categoriesZoneEntity?.categoriesZone ?? [];
          if (categoriesZone[0].nameCategory != 'All') {
            categoriesZone.insert(0, CategoriesZone(nameCategory: 'All'));
          }
          List<Tab> tabs = categoriesZone.map(
            (tab) {
              return Tab(
                text: tab.nameCategory,
              );
            },
          ).toList();
          return SliverFillRemaining(
            hasScrollBody: true,
            child: DefaultTabController(
              length: tabs.length,
              child: Column(
                children: [
                  TabBar(
                    tabAlignment: TabAlignment.start,
                    indicatorSize: TabBarIndicatorSize.tab,
                    dividerColor: Colors.transparent,
                    indicatorPadding:
                        const EdgeInsets.symmetric(horizontal: AppSize.s16),
                    unselectedLabelColor: ColorManager.placeHolderColor2,
                    unselectedLabelStyle: getSemiBoldStyle(
                      color: ColorManager.offwhite,
                      fontSize: AppSize.s16,
                    ),
                    labelStyle: getSemiBoldStyle(
                      color: ColorManager.primaryColor,
                      fontSize: AppSize.s18,
                    ),
                    isScrollable: true,
                    indicator: const UnderlineTabIndicator(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(AppSize.s6),
                        topRight: Radius.circular(AppSize.s6),
                      ),
                      borderSide: BorderSide(
                        color: ColorManager.primaryColor,
                        width: 4,
                      ),
                    ),
                    indicatorColor: ColorManager.primaryColor,
                    indicatorWeight: 1,
                    splashBorderRadius: BorderRadius.circular(AppSize.s20),
                    physics: const BouncingScrollPhysics(),
                    tabs: tabs,
                    onTap: (value) {
                      indexTab = value;
                    },
                  ),
                  const SizedBox(height: AppSize.s14),
                  Expanded(
                    child: TabBarView(
                      children: tabs.map((e) {
                        int currentIndex = tabs.indexOf(e);
                        var f = categoriesZone[currentIndex].idCategory;
                        return ProductsView();
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
        if (state is CategoriesLoading) {
          return SliverToBoxAdapter(child: Lottie.asset(Assets.imagesLoading));
        }
        if (state is CategoriesFail) {}
        return SliverToBoxAdapter(child: Center(child: Text('error')));
      },
    );
  }
}
