
import 'package:fada_alhalij_web/core/common/api_result.dart';
import 'package:fada_alhalij_web/features/categories/data/data_sources/categorieS_zone_data_sourse.dart';
import 'package:fada_alhalij_web/features/categories/domain/entities/categories_zone_entity.dart';
import 'package:fada_alhalij_web/features/categories/domain/repo/category_zone_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CategoriesZoneRepo)
class CategoriesZoneRepoImpl implements CategoriesZoneRepo {
  CategoriesZoneDataSource categoriesZoneDataSource;

  CategoriesZoneRepoImpl(this.categoriesZoneDataSource);

  @override
  Future<Result<CategoriesZoneEntity?>> getCategories() {
    return categoriesZoneDataSource.getCategoriesZone();
  }
}
