import 'package:fada_alhalij_web/core/di/di.dart';
import 'package:fada_alhalij_web/core/widgets/custom_sliver_app_bar.dart';
import 'package:fada_alhalij_web/features/search/presentation/widget/grid_product_search.dart';
import 'package:fada_alhalij_web/features/search/presentation/widget/search_bar.dart';
import 'package:fada_alhalij_web/features/search/presentation/widget/wrap_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/search_cubit.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late SearchCubit viewModel;
  bool isSearching = true;

  @override
  void initState() {
    viewModel = getIt.get<SearchCubit>();
    viewModel.searchProducts(limit: 10);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: viewModel,
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            CustomSliverAppBar(title: 'البحث'),
            CustomSearchBar(viewModel: viewModel),
            SliverToBoxAdapter(child: WrapList()),
            GridProductSearch(),
          ],
        ),
      ),
    );
  }
}





