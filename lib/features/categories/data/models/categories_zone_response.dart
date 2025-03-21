import 'package:fada_alhalij_web/features/categories/domain/entities/categories_zone_entity.dart';

class CategoriesZoneResponse {
  CategoriesZoneResponse({
    this.status,
    this.categoriesZone,
  });

  CategoriesZoneResponse.fromJson(dynamic json) {
    status = json['status'];
    if (json['categoriesZone'] != null) {
      categoriesZone = [];
      json['categoriesZone'].forEach((v) {
        categoriesZone?.add(CategoriesZone.fromJson(v));
      });
    }
  }

  String? status;
  List<CategoriesZone>? categoriesZone;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    if (categoriesZone != null) {
      map['categoriesZone'] = categoriesZone?.map((v) => v.toJson()).toList();
    }
    return map;
  }

  CategoriesZoneEntity toCategoriesZoneEntity() {
    return CategoriesZoneEntity(status: status, categoriesZone: categoriesZone);
  }
}

class CategoriesZone {
  CategoriesZone({
    this.idCategory,
    this.nameCategory,
    this.nameCategoryAr,
    this.imageCategory,
    this.categoryStatus,
    this.zoneCategory,
  });

  CategoriesZone.fromJson(dynamic json) {
    idCategory = json['id_category'];
    nameCategory = json['name_category'];
    nameCategoryAr = json['name_category_ar'];
    imageCategory = json['image_category'];
    categoryStatus = json['category_status'];
    zoneCategory = json['zone_category'];
  }

  num? idCategory;
  String? nameCategory;
  String? nameCategoryAr;
  String? imageCategory;
  num? categoryStatus;
  num? zoneCategory;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id_category'] = idCategory;
    map['name_category'] = nameCategory;
    map['name_category_ar'] = nameCategoryAr;
    map['image_category'] = imageCategory;
    map['category_status'] = categoryStatus;
    map['zone_category'] = zoneCategory;
    return map;
  }
}
