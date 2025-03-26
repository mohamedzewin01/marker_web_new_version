part of 'categories_cubit.dart';

@immutable
sealed class CategoriesState {}

final class CategoriesInitial extends CategoriesState {}

final class CategoriesLoading extends CategoriesState {}

final class CategoriesSuccess extends CategoriesState {
  final CategoriesZoneEntity? categoriesZoneEntity;

  CategoriesSuccess(this.categoriesZoneEntity);
}

final class CategoriesFail extends CategoriesState {
  final Exception exception;

  CategoriesFail(this.exception);
}
