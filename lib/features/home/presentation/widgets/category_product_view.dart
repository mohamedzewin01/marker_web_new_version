import 'package:auto_size_text/auto_size_text.dart';
import 'package:fada_alhalij_web/core/resources/assets_manager.dart';
import 'package:fada_alhalij_web/core/resources/color_manager.dart';
import 'package:fada_alhalij_web/features/products/data/models/products_model_response.dart';
import 'package:fada_alhalij_web/l10n/app_localizations.dart';
import 'package:fada_alhalij_web/core/widgets/custom_product_card.dart';
import 'package:fada_alhalij_web/core/widgets/custom_text_form_field.dart';
import 'package:fada_alhalij_web/core/resources/style_manager.dart';
import 'package:fada_alhalij_web/core/resources/cashed_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/resources/curve_clipper.dart';
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
  List<ProductsRelations>? filteredProducts = [];
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
              return Column(
                children: [
                  Expanded(
                    child: CustomScrollView(
                      slivers: [
                        SliverAppBar(
                          backgroundColor: ColorManager.indigoDark2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              bottom: Radius.circular(4),
                            ),
                          ),
                          title: Row(
                            children: [
                              Container(
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: ColorManager.white,
                                  border: Border.all(
                                    color: ColorManager.placeHolderColor,
                                  ),
                                ),

                                child: CustomImage(
                                  url: widget.category.categoryImage ?? '',
                                  height: 35,
                                  width: 35,
                                ),
                              ),

                              AutoSizeText(
                                widget.category.categoryName ?? '',
                                style: getSemiBoldStyle(
                                  color: ColorManager.white,
                                  fontSize: 20,
                                ),
                              ),

                            ],
                          ),
                          actions: [
                            IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(
                                Icons.arrow_forward_ios,
                                size: 22,
                                color: ColorManager.white,
                              ),
                            ),
                          ],
                          centerTitle: true,
                          floating: true,
                          snap: true,
                          automaticallyImplyLeading: false,
                          flexibleSpace: ClipPath(
                            clipper: InwardCurveClipper(),
                            child: Container(color: ColorManager.indigoDark),
                          ),
                        ),
                        SliverToBoxAdapter(
                          child: Padding(
                            padding: const EdgeInsets.only(
                              right: 16,
                              left: 16,
                              top: 16,
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
                        filteredProducts!.isNotEmpty
                            ? SliverGrid(
                              delegate: SliverChildBuilderDelegate(
                                childCount: filteredProducts?.length,
                                (context, index) => Padding(
                                  padding: EdgeInsets.only(
                                    right: index.isEven ? 16 : 0,
                                    left: index.isOdd ? 16 : 0,
                                  ),
                                  child: CustomProductCardWidget(
                                    product: filteredProducts?[index],
                                  ),
                                ),
                              ),

                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: crossAxisCount,
                                    crossAxisSpacing: 10,
                                    mainAxisSpacing: 10,
                                    mainAxisExtent: 220,
                                  ),
                            )
                            : SliverFillRemaining(
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(height: 24,),
                                    Text(
                                      'لا يوجد منتجات',
                                      style: getSemiBoldStyle(
                                        color: ColorManager.indigoDark,
                                        fontSize: 20,
                                      ),
                                    ),
                                    SizedBox(height: 24),
                                    AspectRatio(
                                      aspectRatio: 16 / 9,
                                      child: SvgPicture.asset(Assets.emptyList),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
