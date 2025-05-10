part of 'best_deals_cubit.dart';

@immutable
sealed class BestDealsState {}

final class BestDealsInitial extends BestDealsState {}
final class BestDealsFail extends BestDealsState {
  final Exception exception;

  BestDealsFail(this.exception);
}
final class BestDealsSuccess extends BestDealsState {
  final FetchBestDealsEntity? fetchBestDealsEntity;

  BestDealsSuccess(this.fetchBestDealsEntity);
}
final class BestDealsLoading extends BestDealsState {}
