part of 'best_discount_by_discount_cubit.dart';

@immutable
sealed class BestDiscountByDiscountState {}

final class BestDiscountByDiscountInitial extends BestDiscountByDiscountState {}
final class BestDiscountByDiscountLoading extends BestDiscountByDiscountState {}
final class BestDiscountByDiscountSuccess extends BestDiscountByDiscountState {
  final BestDealsByDiscountEntity bestDealsByDiscountEntity;

  BestDiscountByDiscountSuccess(this.bestDealsByDiscountEntity);
}
final class BestDiscountByDiscountFail extends BestDiscountByDiscountState {
  final Exception  exception;

  BestDiscountByDiscountFail(this.exception);
}
