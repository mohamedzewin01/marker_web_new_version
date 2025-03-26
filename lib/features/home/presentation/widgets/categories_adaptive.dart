import 'package:fada_alhalij_web/core/di/di.dart';
import 'package:fada_alhalij_web/core/resources/assets_manager.dart';
import 'package:fada_alhalij_web/core/resources/style_manager.dart';
import 'package:fada_alhalij_web/core/widgets/custom_product_card.dart';
import 'package:fada_alhalij_web/core/widgets/custom_text_form_field.dart';
import 'package:fada_alhalij_web/features/products/data/models/products_model_response.dart';
import 'package:fada_alhalij_web/features/products/presentation/cubit/products_cubit.dart';
import 'package:fada_alhalij_web/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/widgets/adaptive layout.dart';


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
    int? idCategory = ModalRoute.of(context)?.settings.arguments as int?;
    return BlocProvider.value(
      value: viewModel..getProductsData(idCategory: '$idCategory' ?? ''),
      child: BlocBuilder<ProductsCubit, ProductsState>(
        builder: (context, state) {
          if (state is ProductsSuccess) {
            List<ProductsRelations> products =
                state.productsModelEntity?.productsData?.productsRelations ??
                [];
            return AdaptiveLayout(
              mobileLayout:
                  (context) => CategoryProductView(products: products),
              tabletLayout:
                  (context) => CategoryProductView(products: products),
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
                          child: CategoryProductView(products: products),
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
            body: const Center(child: CircularProgressIndicator()),
          );
        },
      ),
    );
  }
}





class CategoryProductView extends StatefulWidget {
  const CategoryProductView({super.key, required this.products});

  final List<ProductsRelations> products;

  @override
  State<CategoryProductView> createState() => _CategoryProductViewState();
}

class _CategoryProductViewState extends State<CategoryProductView> {
  // List<ProductsRelations>? filteredProducts;
  //
  // String query = "";
  // TextEditingController searchController = TextEditingController();
  //
  // @override
  // void initState() {
  //   super.initState();
  //   WidgetsBinding.instance.addPostFrameCallback((_) {
  //     setState(() {
  //
  //
  //       filteredProducts = widget.products;
  //     });
  //   });
  // }
  //
  // void updateSearch(String searchQuery) {
  //   setState(() {
  //     query = searchQuery;
  //     if (searchQuery.isEmpty) {
  //       filteredProducts = bestDeals;
  //     } else {
  //       filteredProducts =
  //           bestDeals
  //               ?.where(
  //                 (product) =>
  //             product.productName!.toLowerCase().contains(
  //               searchQuery.toLowerCase(),
  //             ) ||
  //                 product.description!.toLowerCase().contains(
  //                   searchQuery.toLowerCase(),
  //                 ),
  //           )
  //               .toList();
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          // backgroundColor: Colors.orange,
          body: LayoutBuilder(
            builder: (context, constraints) {
              int crossAxisCount =
                  constraints.maxWidth > 900
                      ? 5
                      : constraints.maxWidth > 700
                      ? 3
                      : 2;
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 14,
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: CustomScrollView(
                        slivers: [
                          SliverAppBar(
                            automaticallyImplyLeading: false,
                            backgroundColor: Colors.transparent,
                            elevation: 10,
                            pinned: true,
                            title: Text(
                              AppLocalizations.of(context)?.bestDeals ?? '',
                              style: getSemiBoldStyle(
                                color: ColorManager.black,
                                fontSize: 20,
                              ),
                            ),
                            actions: [
                              IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: Icon(Icons.arrow_forward_ios, size: 22),
                              ),
                            ],
                          ),

                          SliverToBoxAdapter(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                              ),
                              child: CustomTextFormField(
                                controller: TextEditingController(),
                                hintText:
                                    AppLocalizations.of(context)?.whatAreSearch,
                                // enabled: false,
                                onChanged: (value) {
                                  // updateSearch(value);
                                },
                                suffix: Icon(
                                  Icons.search,
                                  color: ColorManager.placeHolderColor2,
                                ),
                              ),
                            ),
                          ),
                          SliverToBoxAdapter(child: SizedBox(height: 16)),

                          SliverGrid(
                            delegate: SliverChildBuilderDelegate(
                              childCount: widget.products.length,
                              (context, index) => CustomProductCardWidget(
                                product: widget.products[index],
                              ),
                            ),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: crossAxisCount,
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 10,
                                  mainAxisExtent: 210,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
