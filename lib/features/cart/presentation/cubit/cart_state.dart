part of 'cart_cubit.dart';

@immutable
sealed class CartState {}

final class CartInitial extends CartState {}
final class CartAddLoading extends CartState {}
final class CartAddFail extends CartState {}

final class CartAddSuccess extends CartState {
final AddToCartEntity? addToCartEntity;
  CartAddSuccess(this.addToCartEntity);
}
final class CartLoading extends CartState {

}
final class CartFail extends CartState {
 final Exception exception;
  CartFail(this.exception);
}
final class CartSuccess extends CartState {
  final CartEntity? cartEntity;
  CartSuccess(this.cartEntity);


}
final class CartDelete extends CartState {}
