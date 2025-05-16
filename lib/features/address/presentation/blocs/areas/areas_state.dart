part of 'areas_cubit.dart';

@immutable
sealed class AreasState {}

final class AreasInitial extends AreasState {}
final class AreasSuccess extends AreasState {
  final DeliveryAreasEntity deliveryAreasEntity;

  AreasSuccess(this.deliveryAreasEntity);
}
final class AreasLoading extends AreasState {}
final class AreasFail extends AreasState {
  final Exception exception;

  AreasFail(this.exception);
}
