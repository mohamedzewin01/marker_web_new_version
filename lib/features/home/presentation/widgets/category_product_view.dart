import 'package:fada_alhalij_web/core/resources/color_manager.dart';
import 'package:fada_alhalij_web/features/products/data/models/products_model_response.dart';
import 'package:fada_alhalij_web/l10n/app_localizations.dart';
import 'package:fada_alhalij_web/core/widgets/custom_product_card.dart';
import 'package:fada_alhalij_web/core/widgets/custom_text_form_field.dart';
import 'package:fada_alhalij_web/core/resources/style_manager.dart';
import 'package:fada_alhalij_web/core/resources/cashed_image.dart';
import 'package:flutter/material.dart';

import '../../data/models/response/home_model_response_dto.dart';

class CategoryProductView extends StatefulWidget {
  const CategoryProductView({
    super.key,
    required this.products,
    required this.category,
  });

  final List<ProductsRelations> products;
  final Categories category;

  @override
  State<CategoryProductView> createState() => _CategoryProductViewState();
}

class _CategoryProductViewState extends State<CategoryProductView> {
  List<ProductsRelations>? filteredProducts;
  List<ProductsRelations>? bestDeals;
  String query = "";
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        bestDeals = widget.products;
        filteredProducts = bestDeals;
      });
    });
  }

  void updateSearch(String searchQuery) {
    setState(() {
      query = searchQuery;
      if (searchQuery.isEmpty) {
        filteredProducts = bestDeals;
      } else {
        filteredProducts =
            bestDeals
                ?.where(
                  (product) =>
              product.productName!.toLowerCase().contains(
                searchQuery.toLowerCase(),
              ) ||
                  product.description!.toLowerCase().contains(
                    searchQuery.toLowerCase(),
                  ),
            )
                .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
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
                            title: Row(
                              children: [
                                Container(

                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: ColorManager.white,
                                    border: Border.all(color: ColorManager.placeHolderColor),
                                  ),

                                  child: CustomImage(
                                    url: widget.category.categoryImage ?? '',
                                    height: 35,
                                    width: 35,
                                  ),
                                ),
                                Spacer(),
                                Expanded(
                                  child: Text(
                                    widget.category.categoryName ?? '',
                                    style: getSemiBoldStyle(
                                      color: ColorManager.black,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                                Spacer(),

                              ],
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
                                controller: searchController,
                                hintText:
                                AppLocalizations.of(context)?.whatAreSearch,
                                // enabled: false,
                                onChanged: (value) {
                                  updateSearch(value);
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
                              childCount: filteredProducts?.length,
                                  (context, index) => CustomProductCardWidget(
                                product: filteredProducts?[index],
                              ),
                            ),
                            gridDelegate:
                            SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: crossAxisCount,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                              mainAxisExtent: 220,
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