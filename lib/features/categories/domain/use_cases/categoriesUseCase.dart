
import 'package:fada_alhalij_web/core/common/api_result.dart';
import 'package:fada_alhalij_web/features/categories/domain/entities/categories_zone_entity.dart';
import 'package:fada_alhalij_web/features/categories/domain/repo/category_zone_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class CategoriesZoneUseCase {
  CategoriesZoneRepo categoriesZoneRepo;

  CategoriesZoneUseCase(this.categoriesZoneRepo);

  Future<Result<CategoriesZoneEntity?>> getCategoriesZone() {
    return categoriesZoneRepo.getCategories();
  }
}
