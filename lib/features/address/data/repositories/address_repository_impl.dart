import 'package:fada_alhalij_web/core/common/api_result.dart';
import 'package:fada_alhalij_web/features/address/domain/entities/address_entity.dart';
import 'package:fada_alhalij_web/features/cart/data/models/request/add_address.dart';
import 'package:fada_alhalij_web/features/cart/domain/entities/cart_entities.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repositories/address_repository.dart';
import '../datasources/address_remote_data_source.dart';

@Injectable(as: AddressRepository)
class AddressRepositoryImpl implements AddressRepository {
  final AddressRemoteDataSource remoteDataSource;

  AddressRepositoryImpl(this.remoteDataSource);

  @override
  Future<Result<GetUserAddressEntity?>> getUserAddress() {
    return remoteDataSource.getUserAddress();
  }

  @override
  Future<Result<AddAddressUserEntity?>> addAddressesUser(
    AddAddressRequest addAddressRequest,
  ) {
    return remoteDataSource.addAddressesUser(addAddressRequest);
  }

  @override
  Future<Result<DeliveryAreasEntity?>> getDeliveryAreas() {
    return remoteDataSource.getDeliveryAreas();
  }
}
