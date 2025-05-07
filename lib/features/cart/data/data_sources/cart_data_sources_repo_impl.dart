import 'package:fada_alhalij_web/core/api/api_extentions.dart';
import 'package:fada_alhalij_web/core/api/api_manager/api_manager.dart';
import 'package:fada_alhalij_web/core/common/api_result.dart';

import 'package:fada_alhalij_web/features/cart/data/models/request/add_to_cart_request.dart';

import 'package:fada_alhalij_web/features/cart/domain/entities/cart_entities.dart';
import 'package:injectable/injectable.dart';

import 'cart_data_sources_repo.dart';

@Injectable(as: CartDataSourcesRepo)
class CartDataSourcesRepoImpl implements CartDataSourcesRepo {
  final ApiService _apiService;

  CartDataSourcesRepoImpl(this._apiService);

  @override
  Future<Result<AddToCartEntity?>> addCart(AddToCartRequest addToCartRequest) {
    return executeApi(() async {
      var response = await _apiService.addToCart(addToCartRequest);
      return response?.toAddToCartEntity();
    });
  }
}
