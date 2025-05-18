part of 'search_cubit.dart';

@immutable
sealed class SearchState {}

final class SearchInitial extends SearchState {}
final class SearchFailure extends SearchState {
  final Exception exception;

  SearchFailure(this.exception);
}
final class SearchSuccess extends SearchState {
  final SearchEntity searchEntity;

  SearchSuccess(this.searchEntity);
}
