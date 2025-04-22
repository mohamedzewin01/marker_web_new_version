import 'package:auto_size_text/auto_size_text.dart';
import 'package:fada_alhalij_web/features/products/presentation/pages/products_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/style_manager.dart';
import '../../../../core/resources/values_manager.dart';

import '../../data/models/categories_zone_response.dart';
import '../cubit/categories_cubit.dart';

class CategoryBar extends StatefulWidget {
  const CategoryBar({super.key, required this.viewModel});

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
          List<Categories>? categoriesZone =
              state.categoriesZoneEntity?.categories ?? [];
          if (categoriesZone[0].categoryName != 'الكل') {
            categoriesZone.insert(0, Categories(categoryName: 'الكل'));
          }
          List<Tab> tabs =
              categoriesZone.map((tab) {
                return Tab(text: tab.categoryName);
              }).toList();
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
                    indicatorPadding: const EdgeInsets.symmetric(
                      horizontal: AppSize.s16,
                    ),
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
                      children:
                          tabs.map((e) {
                            int currentIndex = tabs.indexOf(e);
                            int? idCategory =
                                categoriesZone[currentIndex].categoryId;
                            String id = idCategory?.toString() ?? '';
                            return ProductsView(idCategory: id);
                          }).toList(),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
        if (state is CategoriesLoading) {
          return SliverToBoxAdapter(
            child: Skeletonizer(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  spacing: 12,
                  children: [
                    Expanded(child: AutoSizeText('الكل')),
                    Expanded(child: AutoSizeText('الكلالكلالكل')),
                    Expanded(child: AutoSizeText('الكلالكل')),
                    Expanded(child: AutoSizeText('الكلالكل')),
                  ],
                ),
              ),
            ),
          );
        }
        if (state is CategoriesFail) {}
        return SliverToBoxAdapter(child: Center(child: AutoSizeText('error')));
      },
    );
  }
}
