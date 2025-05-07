part of 'cart_cubit.dart';

@immutable
sealed class CartState {}

final class CartInitial extends CartState {}
final class CartAddLoading extends CartState {}
final class CartAddFail extends CartState {}
final class CartAddSuccess extends CartState {

}

