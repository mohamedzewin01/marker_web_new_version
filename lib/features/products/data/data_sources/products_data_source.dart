import 'package:fada_alhalij_web/core/api/api_extentions.dart';
import 'package:fada_alhalij_web/core/api/api_manager/api_manager.dart';
import 'package:fada_alhalij_web/core/common/api_result.dart';
import 'package:fada_alhalij_web/features/products/domain/entities/products_entities.dart';
import 'package:injectable/injectable.dart';



@injectable
class ProductsDataSource  {
  ApiService apiService;

  ProductsDataSource(this.apiService);

  Future<Result<ProductsModelEntity?>> getProductsData(String idCategory) {
    return executeApi(() async {
      var response = await apiService.getProductsByCategory(idCategory);
      return response.toProductsModelEntity();
    });
  }
}
