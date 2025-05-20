part of 'search_cubit.dart';

@immutable
sealed class SearchState {}

final class SearchInitial extends SearchState {}
final class SearchLoading extends SearchState {}

final class SearchFailure extends SearchState {
  final Exception exception;

  SearchFailure(this.exception);
}
final class SearchSuccess extends SearchState {
  final SearchEntity searchEntity;
  final String? sortBy;
  final String? order;

  SearchSuccess(
      this.searchEntity, {
        this.sortBy,
        this.order,
      });
}
