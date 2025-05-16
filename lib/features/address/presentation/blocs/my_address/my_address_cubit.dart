// import 'package:bloc/bloc.dart';
// import 'package:fada_alhalij_web/core/common/api_result.dart';
// import 'package:fada_alhalij_web/core/uses_cases/address/address_use_case_repo.dart';
// import 'package:fada_alhalij_web/core/utils/cashed_data_shared_preferences.dart';
// import 'package:fada_alhalij_web/features/address/domain/entities/address_entity.dart';
// import 'package:fada_alhalij_web/features/cart/data/models/request/add_address.dart';
// import 'package:fada_alhalij_web/features/cart/domain/entities/cart_entities.dart';
// import 'package:fada_alhalij_web/features/cart/domain/use_cases/cart_use_case.dart';
// import 'package:flutter/material.dart';
// import 'package:injectable/injectable.dart';
// import 'package:meta/meta.dart';
//
// part 'my_address_state.dart';
//
// @injectable
// class MyAddressCubit extends Cubit<MyAddressState> {
//   MyAddressCubit(this._cartUseCase) : super(AddressInitial());
//
//   final AddressUseCaseRepo _cartUseCase;
//
// int? idAddress;
//   final formKeyAreas = GlobalKey<FormState>();
//   Future<void> getAddAddress() async {
//     emit(AddressLoading());
//     final result = await _cartUseCase.getUserAddress();
//     switch (result) {
//       case Success<GetUserAddressEntity?>():
//         {
//           if (!isClosed) {
//             emit(AddressSuccess(result.data!));
//           }
//         }
//       case Fail<GetUserAddressEntity?>():
//         {
//           emit(AddressFailure(result.exception));
//         }
//     }
//   }
//
//   final titleController = TextEditingController();
//   final streetController = TextEditingController();
//   final cityController = TextEditingController();
//   final latController = TextEditingController();
//   final longController = TextEditingController();
//   final detailsController = TextEditingController();
//
//   int? idUser = CacheService.getData(key: CacheConstants.userId) ?? 0;
//
//
//   Future<void> addMyAddress() async {
//     AddAddressRequest addAddressRequest = AddAddressRequest(
//       deliveryAreaId: 1,
//       userId: idUser,
//       title: titleController.text,
//       street: streetController.text,
//       city: cityController.text,
//       lat: latController.text,
//       long: longController.text,
//       details: detailsController.text,
//     );
//     final result = await _cartUseCase.addAddressesUser(addAddressRequest);
//     switch (result) {
//       case Success<AddAddressUserEntity?>():
//         {
//           if (!isClosed) {
//             emit(AddAddressSuccess(result.data!));
//           }
//         }
//       case Fail<AddAddressUserEntity?>():
//         {
//           emit(AddressFailure(result.exception));
//         }
//     }
//   }
//
//   void setIdAddress(int? idAddress) {
//     if (state is OrdersWithAddress) {
//       emit((state as OrdersWithAddress).copyWith(idAddress: idAddress));
//     } else {
//       // في حال كانت الحالة غير حالة OrdersWithAddress، نقوم بتعيين القيمة فقط
//       emit(OrdersWithAddress(idAddress: idAddress));
//     }
//   }
//
// }
