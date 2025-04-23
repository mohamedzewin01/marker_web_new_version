import 'package:auto_size_text/auto_size_text.dart';
import 'package:fada_alhalij_web/core/di/di.dart';
import 'package:fada_alhalij_web/core/widgets/custom_product_card.dart';
import 'package:fada_alhalij_web/features/best_deals/presention/cubit/best_by_discount/best_discount_by_discount_cubit.dart';
import 'package:fada_alhalij_web/l10n/app_localizations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/style_manager.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../../data/models/best_deals_by_discount.dart';

class BestDealsByDiscountView extends StatefulWidget {
  const BestDealsByDiscountView({super.key, this.discount});

  final int? discount;

  @override
  State<BestDealsByDiscountView> createState() =>
      _BestDealsByDiscountViewState();
}

class _BestDealsByDiscountViewState extends State<BestDealsByDiscountView> {
  late BestDiscountByDiscountCubit viewModel;

  @override
  void initState() {
    viewModel = getIt.get<BestDiscountByDiscountCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: viewModel..getBestDealsByCategories(widget.discount ),
      child: SafeArea(
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
                return BlocBuilder<
                  BestDiscountByDiscountCubit,
                  BestDiscountByDiscountState
                >(
                  builder: (context, state) {
                    if (state is BestDiscountByDiscountSuccess) {
                      List<BestDeals> bestDealsByDiscount =
                          state.bestDealsByDiscountEntity.bestDeals?.reversed
                              .toList() ??
                          [];

                      ///
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GridView.builder(
                          itemCount: bestDealsByDiscount.length,


                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 8,
                                crossAxisSpacing: 8,
                                mainAxisExtent: 220,
                              ),
                          itemBuilder:
                              (context, index) => CustomProductCardWidget(
                                product:
                                    bestDealsByDiscount[index]
                                        .toProductsRelations(),
                              ),
                          padding: EdgeInsets.symmetric(
                            vertical: 8,
                          ), // تأكد من إزالة أي padding
                        ),
                      );
                    }
                    return CircularProgressIndicator(
                      color: ColorManager.orange,
                    );
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

// class BestDealsByDiscountBody extends StatelessWidget {
//   const BestDealsByDiscountBody({super.key, required this.crossAxisCount});
//
//   final int crossAxisCount;
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Expanded(
//           child: CustomScrollView(
//             slivers: [
//               SliverAppBar(
//                 automaticallyImplyLeading: false,
//                 backgroundColor: ColorManager.indigoDark2,
//                 elevation: 10,
//                 pinned: false,
//                 floating: true,
//                 snap: true,
//                 title: Text(
//                   AppLocalizations.of(context)?.bestDeals ?? '',
//                   style: getSemiBoldStyle(
//                     color: ColorManager.white,
//                     fontSize: 20,
//                   ),
//                 ),
//                 actions: [
//                   IconButton(
//                     onPressed: () {
//                       Navigator.pop(context);
//                     },
//                     icon: Icon(
//                       Icons.arrow_forward_ios,
//                       size: 22,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ],
//               ),
//
//               SliverToBoxAdapter(
//                 child: Padding(
//                   padding: const EdgeInsets.only(top: 16, right: 16, left: 16),
//                   child: CustomTextFormField(
//                     controller: searchController,
//                     hintText: AppLocalizations.of(context)?.whatAreSearch,
//                     // enabled: false,
//                     onChanged: (value) {
//                       updateSearch(value);
//                     },
//                     suffix: Icon(
//                       Icons.search,
//                       color: ColorManager.placeHolderColor2,
//                     ),
//                   ),
//                 ),
//               ),
//
//               // SliverToBoxAdapter(child: SizedBox(height: 16)),
//               filteredProducts?.length != 0
//                   ? SliverGrid(
//                     delegate: SliverChildBuilderDelegate(
//                       childCount: filteredProducts?.length,
//                       (context, index) => Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: CustomProductCardWidget(
//                           product:
//                               filteredProducts?[index].toProductsRelations(),
//                         ),
//                       ),
//                     ),
//                     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                       crossAxisCount: crossAxisCount,
//                       // crossAxisSpacing: 10,
//                       // mainAxisSpacing: 10,
//                       mainAxisExtent: 230,
//                     ),
//                   )
//                   : SliverToBoxAdapter(
//                     child: Center(
//                       child: AutoSizeText(
//                         'جاري تجهز العروض ...',
//                         style: getSemiBoldStyle(
//                           color: ColorManager.red,
//                           fontSize: 16,
//                         ),
//                       ),
//                     ),
//                   ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }
