import '../../data/models/categories_zone_response.dart';

class CategoriesZoneEntity {
  CategoriesZoneEntity({
    this.status,
    this.categoriesZone,
  });

  String? status;
  List<CategoriesZone>? categoriesZone;
}
