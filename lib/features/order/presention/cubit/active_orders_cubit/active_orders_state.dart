part of 'active_orders_cubit.dart';

@immutable
sealed class ActiveOrdersState {}

final class ActiveOrdersInitial extends ActiveOrdersState {}
final class OrdersActiveLoading extends ActiveOrdersState {}
final class OrdersActiveSuccess extends ActiveOrdersState {
  final GetActiveOrdersEntity getActiveOrdersEntity;

  OrdersActiveSuccess(this.getActiveOrdersEntity);
}
final class OrdersActiveFail extends ActiveOrdersState {
  final Exception exception;

  OrdersActiveFail(this.exception);
}



final class OrdersCompletedLoading extends ActiveOrdersState {}
final class OrdersCompletedSuccess extends ActiveOrdersState {
  final GetActiveOrdersEntity getActiveOrdersEntity;

  OrdersCompletedSuccess(this.getActiveOrdersEntity);
}
final class OrdersCompletedFail extends ActiveOrdersState {
  final Exception exception;

  OrdersCompletedFail(this.exception);
}