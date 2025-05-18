import 'package:fada_alhalij_web/core/resources/cashed_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

import '../blocs/search_cubit.dart';



class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key, required this.viewModel});
  final SearchCubit viewModel;
  @override
  Widget build(BuildContext context) {
    return    BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        return SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TypeAheadField(
              controller: viewModel.searchController,
              suggestionsCallback: (search) {
                return viewModel.productsSuggested
                    .where(
                      (product) =>
                      product.productName!.toLowerCase().contains(
                        viewModel.searchController.text
                            .toLowerCase(),
                      ),
                )
                    .toList();
              },
              builder: (context, controller, focusNode) {
                return TextField(
                  controller: controller,
                  focusNode: focusNode,
                  onChanged: (value) {
                    viewModel.suggestedProductsSearch(limit: 4, search: value);
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'بحث ...',
                  ),
                );
              },
              itemBuilder: (context, product) {
                return Card(
                  child: ListTile(
                    leading: SizedBox(
                      height: 25,
                      width: 25,
                      child: CustomImage(url: product.imageCover ?? ''),
                    ),
                    title: Text(product.productName ?? ''),
                    subtitle: Text(product.productPrice.toString()),
                  ),
                );
              },
              onSelected: (product) {
                viewModel.searchProducts();
              },
            ),
          ),
        );
      },
    );
  }
}