part of 'address_cubit.dart';

@immutable
sealed class AddressState {}

final class AddressInitial extends AddressState {}
final class AddressLoading extends AddressState {}
final class AddressSuccess extends AddressState {
  final GetAddressesUserEntity addressesUserEntity;

  AddressSuccess(this.addressesUserEntity);
}
final class AddressFailure extends AddressState {
  final Exception exception;

  AddressFailure(this.exception);
}

final class AddAddressLoading extends AddressState {}
final class AddAddressSuccess extends AddressState {
  final AddAddressUserEntity addAddressUserEntity;

  AddAddressSuccess(this.addAddressUserEntity);
}
final class AddAddressFailure extends AddressState {
  final Exception exception;

  AddAddressFailure(this.exception);
}