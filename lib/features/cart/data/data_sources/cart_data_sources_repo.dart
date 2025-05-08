import 'package:fada_alhalij_web/core/common/api_result.dart';
import 'package:fada_alhalij_web/features/cart/data/models/request/add_to_cart_request.dart';
import 'package:fada_alhalij_web/features/cart/data/models/request/update_cart_item.dart';
import 'package:fada_alhalij_web/features/cart/domain/entities/cart_entities.dart';

abstract class CartDataSourcesRepo {
  Future<Result<AddToCartEntity?>> addCart(AddToCartRequest addToCartRequest);
  Future<Result<UpdateCartItemEntity?>> updateCart(UpdateCartItemRequest updateCartItemRequest);
  Future<Result<CartEntity?>> getCart();
}
