part of 'search_cubit.dart';

@immutable
sealed class SearchState {}

final class SearchInitial extends SearchState {}
final class SearchSuccess extends SearchState {
 final List<ProductsRelations> productsList;

  SearchSuccess({required this.productsList});
}
