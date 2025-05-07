


import 'package:fada_alhalij_web/core/common/api_result.dart';
import 'package:fada_alhalij_web/features/cart/data/models/request/add_to_cart_request.dart';
import 'package:fada_alhalij_web/features/cart/domain/entities/cart_entities.dart';

abstract class CartRepo {
  Future<Result<AddToCartEntity?>> addCart(AddToCartRequest addToCartRequest);
}