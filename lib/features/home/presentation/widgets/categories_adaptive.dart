import 'package:fada_alhalij_web/core/di/di.dart';
import 'package:fada_alhalij_web/core/resources/assets_manager.dart';

import 'package:fada_alhalij_web/core/resources/color_manager.dart';
import 'package:fada_alhalij_web/core/resources/style_manager.dart';

import 'package:fada_alhalij_web/core/widgets/adaptive%20layout.dart';

import 'package:fada_alhalij_web/features/products/data/models/products_model_response.dart';
import 'package:fada_alhalij_web/features/products/presentation/cubit/products_cubit.dart';
import 'package:fada_alhalij_web/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../data/models/response/home_model_response_dto.dart';
import 'category_product_view.dart';

class CategoriesAdaptive extends StatefulWidget {
  const CategoriesAdaptive({super.key});

  @override
  State<CategoriesAdaptive> createState() => _CategoriesAdaptiveState();
}

class _CategoriesAdaptiveState extends State<CategoriesAdaptive> {
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
    Categories category =
        ModalRoute.of(context)?.settings.arguments as Categories;
    return BlocProvider.value(
      value: viewModel..getProductsData(idCategory: '${category.categoryId}'),
      child: BlocBuilder<ProductsCubit, ProductsState>(
        builder: (context, state) {
          if (state is ProductsSuccess) {
            List<ProductsRelations> products =
                state.productsModelEntity?.productsData?.productsRelations ??
                [];
            return AdaptiveLayout(
              mobileLayout:
                  (context) => CategoryProductView(
                    products: products,
                    category: category,
                  ),
              tabletLayout:
                  (context) => CategoryProductView(
                    products: products,
                    category: category,
                  ),
              desktopLayout:
                  (context) => Center(
                    child: Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Scaffold(
                            backgroundColor: ColorManager.primaryColor,
                            body: Center(
                              child: Image.asset(Assets.logo, scale: 2.5),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: CategoryProductView(
                            products: products,
                            category: category,
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Scaffold(
                            backgroundColor: ColorManager.primaryColor,
                            body: Center(
                              child: Image.asset(Assets.logo, scale: 2.5),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
            );
          }
          return Scaffold(
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: CircularProgressIndicator(color: ColorManager.orange),
                ),
                SizedBox(height: 22),
                Text(
                  AppLocalizations.of(context)?.waiting??'',
                  style: getSemiBoldStyle(
                    color: ColorManager.orange,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
