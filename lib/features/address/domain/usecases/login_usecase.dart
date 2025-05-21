import 'package:fada_alhalij_web/core/common/api_result.dart';
import 'package:fada_alhalij_web/core/uses_cases/address/address_use_case_repo.dart';
import 'package:fada_alhalij_web/features/address/data/models/request/edit_address_request.dart';
import 'package:fada_alhalij_web/features/address/domain/entities/address_entity.dart';
import 'package:fada_alhalij_web/features/cart/data/models/request/add_address.dart';
import 'package:fada_alhalij_web/features/cart/domain/entities/cart_entities.dart';
import 'package:injectable/injectable.dart';

import '../repositories/address_repository.dart';

@Injectable(as: AddressUseCaseRepo)
class LoginUseCase implements AddressUseCaseRepo {
  final AddressRepository repository;

  LoginUseCase(this.repository);

  @override
  Future<Result<GetUserAddressEntity?>> getUserAddress() {
    return repository.getUserAddress();
  }

  @override
  Future<Result<AddAddressUserEntity?>> addAddressesUser(
    AddAddressRequest addAddressRequest,
  ) {
    return repository.addAddressesUser(addAddressRequest);
  }

  @override
  Future<Result<DeliveryAreasEntity?>> getDeliveryAreas() {
    return repository.getDeliveryAreas();
  }

  @override
  Future<Result<EditAddressEntity?>> editAddressesUser(EditAddressRequest editAddressRequest) {
  return repository.editAddressesUser(editAddressRequest);
  }
}
