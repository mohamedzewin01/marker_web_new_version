// part of 'my_address_cubit.dart';
//
// @immutable
// sealed class MyAddressState {}
//
// final class AddressInitial extends MyAddressState {}
// final class AddressLoading extends MyAddressState {}
// final class AddressSuccess extends MyAddressState {
//   final GetUserAddressEntity addressesUserEntity;
//
//   AddressSuccess(this.addressesUserEntity);
// }
// final class AddressFailure extends MyAddressState {
//   final Exception exception;
//
//   AddressFailure(this.exception);
// }
//
// final class AddAddressLoading extends MyAddressState {}
// final class AddAddressSuccess extends MyAddressState {
//   final AddAddressUserEntity addAddressUserEntity;
//
//   AddAddressSuccess(this.addAddressUserEntity);
// }
// final class AddAddressFailure extends MyAddressState {
//   final Exception exception;
//
//   AddAddressFailure(this.exception);
// }
//
// class OrdersWithAddress extends MyAddressState {
//   final int? idAddress;
//
//   OrdersWithAddress({this.idAddress});
//
//   OrdersWithAddress copyWith({int? idAddress}) {
//     return OrdersWithAddress(
//       idAddress: idAddress ?? this.idAddress,
//     );
//   }
// }