part of 'cart_update_cubit.dart';

@immutable
sealed class CartUpdateState {}

final class CartUpdateInitial extends CartUpdateState {}
final class CartRemoveItem extends CartUpdateState {}
