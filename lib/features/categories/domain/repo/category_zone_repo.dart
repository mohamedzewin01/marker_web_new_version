

import 'package:fada_alhalij_web/core/common/api_result.dart';
import 'package:fada_alhalij_web/features/categories/domain/entities/categories_zone_entity.dart';

abstract class CategoriesZoneRepo {
  Future<Result<CategoriesZoneEntity?>> getCategories();
}
