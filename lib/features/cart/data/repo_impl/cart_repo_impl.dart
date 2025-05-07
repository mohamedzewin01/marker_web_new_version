




import 'package:fada_alhalij_web/core/common/api_result.dart';
import 'package:fada_alhalij_web/features/cart/data/data_sources/cart_data_sources_repo.dart';
import 'package:fada_alhalij_web/features/cart/data/models/request/add_to_cart_request.dart';
import 'package:fada_alhalij_web/features/cart/domain/entities/cart_entities.dart';
import 'package:fada_alhalij_web/features/cart/domain/repo/cart_repo.dart';
import 'package:injectable/injectable.dart';



@Injectable(as: CartRepo)
class CartRepoImpl extends CartRepo {
  final CartDataSourcesRepo cartDataSourcesRepo;

  CartRepoImpl(this.cartDataSourcesRepo);

  @override
  Future<Result<AddToCartEntity?>> addCart(AddToCartRequest addToCartRequest) {
    return cartDataSourcesRepo.addCart(addToCartRequest);
  }

}