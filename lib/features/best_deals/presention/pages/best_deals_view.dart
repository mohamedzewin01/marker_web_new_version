import 'package:auto_size_text/auto_size_text.dart';
import 'package:fada_alhalij_web/core/di/di.dart';
import 'package:fada_alhalij_web/core/resources/cashed_image.dart';
import 'package:fada_alhalij_web/core/resources/color_manager.dart';
import 'package:fada_alhalij_web/core/resources/style_manager.dart';
import 'package:fada_alhalij_web/core/widgets/custom_product_card.dart';
import 'package:fada_alhalij_web/core/widgets/custom_sliver_app_bar.dart';
import 'package:fada_alhalij_web/features/best_deals/data/models/best_deals_by_categories_model.dart';
import 'package:fada_alhalij_web/features/best_deals/presention/cubit/best_deals_categories_cubit.dart';
import 'package:fada_alhalij_web/features/best_deals/presention/widgets/sk_best_deals.dart';
import 'package:fada_alhalij_web/features/layout/presentation/cubit/layout_cubit.dart';
import 'package:fada_alhalij_web/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';



class BestDealsView extends StatefulWidget {
  const BestDealsView({super.key});

  @override
  State<BestDealsView> createState() => _BestDealsViewState();
}

class _BestDealsViewState extends State<BestDealsView> {
  late BestDealsCategoriesCubit viewModel;

  @override
  void initState() {
    viewModel = getIt.get<BestDealsCategoriesCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: viewModel..getBestDealsByCategories(),
      child: BestDealsBody(),
    );
  }
}

class BestDealsBody extends StatelessWidget {
  const BestDealsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult:
          (didPop, result) =>  LayoutCubit.get(context).changeIndex(0),
      child: Scaffold(
        body: BlocBuilder<BestDealsCategoriesCubit, BestDealsCategoriesState>(
          builder: (context, state) {
            if (state is BestDealsCategoriesSuccess) {
              List<CategoryList>? bestDealsCategories =
                  state.bestDealsByCategoriesEntity.categoryList?.reversed
                      .toList() ??
                  [];
              return CustomScrollView(
                slivers: [
                  CustomSliverAppBar(
                    onPressed: () => LayoutCubit.get(context).changeIndex(0),
                    title: AppLocalizations.of(context)!.bestDeals,
                    leading: Center(
                      child: Text(
                        PromotionalMessages.exclusiveSurprisesOnOrder,
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child:bestDealsCategories.isNotEmpty? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: List.generate(bestDealsCategories.length, (
                        index,
                      ) {
                        List<DiscountedProducts>? products =
                            bestDealsCategories[index]
                                .discountedProducts
                                ?.reversed
                                .toList() ??
                            [];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            spacing: 16,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 12),
                                child: Row(

                                  // mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.all(8),
                                      clipBehavior: Clip.antiAlias,
                                      decoration: BoxDecoration(

                                        shape: BoxShape.circle,
                                        color: ColorManager.placeHolderColor,
                                      ),
                                      child: CustomImage(
                                        url: bestDealsCategories[index].categoryImage ?? '',
                                        height: 30,
                                        width: 30,
                                      ),
                                    ),
                            SizedBox(width: 16,),
                                    Text(
                                      bestDealsCategories[index].categoryName ?? '',
                                      style: getSemiBoldStyle(
                                        color: ColorManager.indigoDark2,
                                        fontSize: 14,
                                      ),
                                    ),
                                    SizedBox(width: 8,),
                                    SizedBox(
                                      width: 24,
                                      child: Divider(
                                        color: ColorManager.indigoDark2,
                                        thickness: 1,),
                                    )


                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 220,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: products.length,
                                  itemBuilder: (context, productIndex) {
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 4,
                                      ),
                                      child: CustomProductCardWidget(
                                        product:
                                            products[productIndex]
                                                .toProductsRelations(),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                    ):Center(
                      child: Align(
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            AutoSizeText(
                              'جاري تجهز العروض ...',
                              style: getSemiBoldStyle(color: ColorManager.red, fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: 60,
                    ),
                  )

                ],
              );
            }
            return SkBestDeals();

          },
        ),
      ),
    );
  }
}


