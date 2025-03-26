
import 'package:fada_alhalij_web/core/api/api_extentions.dart';
import 'package:fada_alhalij_web/core/api/api_manager/api_manager.dart';
import 'package:fada_alhalij_web/core/common/api_result.dart';
import 'package:fada_alhalij_web/features/categories/domain/entities/categories_zone_entity.dart';
import 'package:injectable/injectable.dart';



@injectable
class CategoriesZoneDataSource {
  ApiService apiService;

  CategoriesZoneDataSource(this.apiService);

  Future<Result<CategoriesZoneEntity?>> getCategoriesZone() {
    return executeApi(
      () async {
        var response = await apiService.getCategories();

        return response.toCategoriesZoneEntity();
      },
    );
  }
}
