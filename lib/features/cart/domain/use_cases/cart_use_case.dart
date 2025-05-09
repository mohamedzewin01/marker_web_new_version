



import 'package:fada_alhalij_web/core/common/api_result.dart';
import 'package:fada_alhalij_web/features/cart/data/models/request/add_to_cart_request.dart';
import 'package:fada_alhalij_web/features/cart/data/models/request/delete_item_cart_request.dart';
import 'package:fada_alhalij_web/features/cart/data/models/request/update_cart_item.dart';
import 'package:fada_alhalij_web/features/cart/domain/entities/cart_entities.dart';
import 'package:fada_alhalij_web/features/cart/domain/repo/cart_repo.dart';
import 'package:injectable/injectable.dart';


@injectable
class CartUseCase {
  final CartRepo _cartRepo;

  CartUseCase(this._cartRepo);
  Future<Result<AddToCartEntity?>> addCart(AddToCartRequest addToCartRequest){
    return _cartRepo.addCart(addToCartRequest);
  }
  Future<Result<CartEntity?>> getCart(){
    return _cartRepo.getCart();
  }
  Future<Result<UpdateCartItemEntity?>> updateCart(UpdateCartItemRequest updateCartItemRequest){
    return _cartRepo.updateCart(updateCartItemRequest);
  }

  Future<Result<DelItemCartEntity?>> deleteCart(DeleteItemCartRequest deleteItemCartRequest){
    return _cartRepo.deleteCart(deleteItemCartRequest);
  }
}