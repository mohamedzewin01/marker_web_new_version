import 'package:bloc/bloc.dart';
import 'package:fada_alhalij_web/core/common/api_result.dart';
import 'package:fada_alhalij_web/core/functions/extenstions.dart';
import 'package:fada_alhalij_web/core/uses_cases/search/search_use_case_repo.dart';
import 'package:fada_alhalij_web/features/products/data/models/products_model_response.dart';
import 'package:fada_alhalij_web/features/search/data/models/request/search_request.dart';
import 'package:fada_alhalij_web/features/search/data/models/response/search_dto.dart';
import 'package:fada_alhalij_web/features/search/domain/entities/search_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'search_state.dart';

@injectable
class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this._searchUseCaseRepo) : super(SearchInitial());

  final SearchUseCaseRepo _searchUseCaseRepo;

  static SearchCubit get(context) => BlocProvider.of(context);

  int? selectedIndex;
  TextEditingController searchController = TextEditingController();
  List<DataSearch> productsSuggested = [];

  Future<void> suggestedProductsSearch({
    categoryId,
    minPrice,
    maxPrice,
    sortBy,
    order,
    limit,
    search

  }) async {
    var result = await _searchUseCaseRepo.search(
      SearchRequest(
        limit: 3,
        search:search,
        minPrice: minPrice,
        maxPrice: maxPrice,
        sortBy: sortBy,
        order: order,
        categoryId: categoryId,
        pagination: true
      ),
    );
    switch (result) {
      case Success<SearchEntity?>():
        {
          if (!isClosed) {
            productsSuggested.clear();
            productsSuggested.addAll(result.data!.data!);
            emit(SearchSuccess(result.data!));
          }
        }

      case Fail<SearchEntity?>():
        {
          emit(SearchFailure(result.exception));
        }
    }
  }

  Future<void> searchProducts({
    categoryId,
    minPrice,
    maxPrice,
    sortBy,
    order,
    limit,
  }) async {
    var result = await _searchUseCaseRepo.search(
      SearchRequest(
        limit: limit,
        search: searchController.text,
        minPrice: minPrice,
        maxPrice: maxPrice,
        sortBy: sortBy,
        order: order,
        categoryId: categoryId,
        pagination: true
      ),
    );
    switch (result) {
      case Success<SearchEntity?>():
        {
          if (!isClosed) {
            emit(SearchSuccess(result.data!));
          }
        }

      case Fail<SearchEntity?>():
        {
          emit(SearchFailure(result.exception));
        }
    }
  }
}
