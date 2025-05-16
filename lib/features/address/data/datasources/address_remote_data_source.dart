import 'package:fada_alhalij_web/core/common/api_result.dart';
import 'package:fada_alhalij_web/features/address/domain/entities/address_entity.dart';
import 'package:fada_alhalij_web/features/cart/data/models/request/add_address.dart';
import 'package:fada_alhalij_web/features/cart/domain/entities/cart_entities.dart';

abstract class AddressRemoteDataSource {
Future<Result<GetUserAddressEntity?>>getUserAddress();
Future<Result<DeliveryAreasEntity?>>getDeliveryAreas();
Future<Result<AddAddressUserEntity?>>addAddressesUser(AddAddressRequest addAddressRequest);
}
