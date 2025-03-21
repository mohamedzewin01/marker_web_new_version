import 'package:fada_alhalij_web/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fada_alhalij_web/core/resources/color_manager.dart';
import 'package:fada_alhalij_web/features/home/presentation/widgets/skeleton_home.dart';

import '../../../../core/di/di.dart';
import '../../../../core/widgets/see_all_view.dart';
import '../../../layout/presentation/cubit/layout_cubit.dart';
import '../../data/models/response/HomeModelResponseDto.dart';
import '../cubit/home_cubit.dart';
import '../widgets/app_bar_body.dart';
import '../widgets/carousel.dart';
import '../widgets/grid_categories.dart';
import '../widgets/horizontal_product_list.dart';
import '../widgets/search_text_filed.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late HomeCubit viewModel;

  @override
  void initState() {
    viewModel = getIt<HomeCubit>();
    super.initState();
  }

  @override
  void dispose() {
    viewModel.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => viewModel..getHomeData(),
        child: Scaffold(
          body: NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [AppBarBody()];
          }, body: BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              if (state is HomeSuccess) {
                List<Categories>? categories =
                    state.homeEntity?.data?.category?.categories ?? [];
                List<Products>? bestDeals =
                    state.homeEntity?.data?.bestDeals?.products ?? [];
                return RefreshIndicator(
                  color: ColorManager.primaryColor,
                  onRefresh: () => viewModel.getHomeData(),
                  child: SingleChildScrollView(
                    child: Column(children: [
                      SearchTextFiled(),
                      Padding(
                          padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                          child: Carousel()),
                      Column(
                        children: [
                          SizedBox(
                            height: 16,
                          ),
                          SeeAllView(
                              context: context,
                              name: '${AppLocalizations.of(context)!.category} 🛍️',


                              onTapAction: () {
                                LayoutCubit.get(context).changeIndex(1);
                              }),
                          SizedBox(
                            height: 16,
                          ),
                          GridCategories(
                            categories: categories,
                          ),
                          SeeAllView(
                              context: context,
                              name: "Best deals 🔥",
                              onTapAction: () {
                                /// TODO: ALL BEST DEALS
                              }),
                          SizedBox(
                            height: 12,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 16),
                            child: SizedBox(
                                height: 210,
                                child: BestDealsProductList(
                                  bestDeals: bestDeals,
                                )),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                        ],
                      ),
                    ]),
                  ),
                );
              }
              if (state is HomeLoading) {
                return SkeletonHome();
              }
              if (state is HomeFail) {}
              return Text('error');
            },
          )),
        ));
  }
}
