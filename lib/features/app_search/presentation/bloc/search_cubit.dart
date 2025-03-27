import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../products/data/models/products_model_response.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());

  static SearchCubit get(context) => BlocProvider.of(context);

  List<ProductsRelations> allProducts = [];
  List<ProductsRelations> filteredProducts = [];

  TextEditingController searchController = TextEditingController();

  void searchProducts(List<ProductsRelations> productsList) {
    allProducts = productsList;
    filteredProducts = List.from(allProducts); // نسخ جميع المنتجات مبدئيًا
    emit(SearchSuccess(productsList: filteredProducts));
  }

  void updateSearch(String searchQuery) {
    if (searchQuery.isEmpty) {
      filteredProducts = List.from(allProducts);
    } else {
      filteredProducts = allProducts
          .where((product) =>
      product.productName!.toLowerCase().contains(searchQuery.toLowerCase()) ||
          product.description!.toLowerCase().contains(searchQuery.toLowerCase()))
          .toList();

    }
    emit(SearchSuccess(productsList: filteredProducts));
  }
}
