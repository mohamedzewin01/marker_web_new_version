part of 'best_deals_categories_cubit.dart';

@immutable
sealed class BestDealsCategoriesState {}

final class BestDealsCategoriesInitial extends BestDealsCategoriesState {}
final class BestDealsCategoriesLoading extends BestDealsCategoriesState {}
final class BestDealsCategoriesSuccess extends BestDealsCategoriesState {

  final BestDealsByCategoriesEntity bestDealsByCategoriesEntity;
  BestDealsCategoriesSuccess(this.bestDealsByCategoriesEntity);

}
