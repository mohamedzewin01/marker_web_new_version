import 'package:fada_alhalij_web/core/resources/routes_manager.dart';
import 'package:fada_alhalij_web/core/utils/cashed_data_shared_preferences.dart';
import 'package:fada_alhalij_web/features/home/presentation/widgets/skeleton_home.dart';
import 'package:fada_alhalij_web/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fada_alhalij_web/core/resources/color_manager.dart';
import '../../../../core/di/di.dart';
import '../../../../core/functions/launch_url.dart';
import '../../../../core/widgets/see_all_view.dart';
import '../../../layout/presentation/cubit/layout_cubit.dart';
import '../../data/models/response/home_model_response_dto.dart';
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
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is HomeSuccess) {
            List<Categories>? categories =
                state.homeEntity?.data?.category?.categories ?? [];
            List<ProductsBestDeals>? bestDeals =
                state.homeEntity?.data?.bestDeals?.productsBestDeals?.reversed
                    .toList() ??
                [];
            Store? store = state.homeEntity?.data!.store;
            List<Banners> banners =
                state.homeEntity?.data?.banner?.banners ?? [];

            return GestureDetector(
              onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
              child: Scaffold(
                body: NestedScrollView(
                  headerSliverBuilder: (context, innerBoxIsScrolled) {
                    return [AppBarBody(store: store)];
                  },
                  body: RefreshIndicator(
                    color: ColorManager.primaryColor,
                    onRefresh: () => viewModel.getHomeData(),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(height: 8),
                          SearchTextFiled(),
                          Padding(
                            padding: const EdgeInsets.only(top: 12),
                            child: Carousel(banners: banners),
                          ),
                          Column(
                            children: [
                              SizedBox(height: 8),
                              SeeAllView(
                                context: context,
                                name:
                                    '${AppLocalizations.of(context)!.category} 🛍️',
                                onTapAction: () {
                                  LayoutCubit.get(context).changeIndex(1);
                                },
                              ),
                              SizedBox(height: 16),
                              GridCategories(categories: categories),
                              SeeAllView(
                                context: context,
                                name:
                                    "${AppLocalizations.of(context)!.bestDeals} 🔥",
                                onTapAction: () {
                                  Navigator.pushNamed(
                                    context,
                                    RoutesManager.bestDealsAdaptive,
                                    arguments: bestDeals,
                                  );
                                },
                              ),

                              BestDealsProductList(
                                bestDeals: bestDeals,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          }

          if (state is HomeLoading) {
            return SkeletonHome();
          }
          if (state is HomeFail) {}
          if (state is HomeLoading) {
            return SkeletonHome();
          }
          return Text('error');
        },
      ),
    );
  }
}
