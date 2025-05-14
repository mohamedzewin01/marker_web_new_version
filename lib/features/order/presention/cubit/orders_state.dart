part of 'orders_cubit.dart';

@immutable
sealed class OrdersState {}

final class OrdersInitial extends OrdersState {}
final class AddOrdersLoading extends OrdersState {}


final class AddOrdersSuccess extends OrdersState {
  final AddOrderEntity addOrderEntity;

  AddOrdersSuccess(this.addOrderEntity);
}
final class AddOrdersFail extends OrdersState {
  final Exception exception;

  AddOrdersFail(this.exception);
}

final class OrdersActiveLoading extends OrdersState {}
final class OrdersActiveSuccess extends OrdersState {
  final GetActiveOrdersEntity getActiveOrdersEntity;

  OrdersActiveSuccess(this.getActiveOrdersEntity);
}
final class OrdersActiveFail extends OrdersState {
  final Exception exception;

  OrdersActiveFail(this.exception);
}

