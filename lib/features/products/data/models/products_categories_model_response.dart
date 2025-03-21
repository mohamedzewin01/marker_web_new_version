class ProductsCategoriesModelResponse {
  ProductsCategoriesModelResponse({
    this.status,
    this.categoryProducts,
  });

  ProductsCategoriesModelResponse.fromJson(dynamic json) {
    status = json['status'];
    if (json['categoryProducts'] != null) {
      categoryProducts = [];
      json['categoryProducts'].forEach((v) {
        categoryProducts?.add(CategoryProducts.fromJson(v));
      });
    }
  }

  String? status;
  List<CategoryProducts>? categoryProducts;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    if (categoryProducts != null) {
      map['categoryProducts'] =
          categoryProducts?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class CategoryProducts {
  CategoryProducts({
    this.idProduct,
    this.nameProduct,
    this.nameProductAr,
    this.imageProduct,
    this.description,
    this.descriptionAr,
    this.priceOld,
    this.priceNew,
    this.qunantity,
    this.discount,
    this.status,
    this.createdAt,
    this.productsCategoryId,
    this.productsZoneId,
    this.idCategory,
    this.nameCategory,
    this.imageCategory,
    this.categoryStatus,
    this.zoneCategory,
    this.zoneId,
    this.zoneName,
    this.zoneImage,
    this.zoneStatus,
  });

  CategoryProducts.fromJson(dynamic json) {
    idProduct = json['id_product'];
    nameProduct = json['name_product'];
    nameProductAr = json['name_product_ar'];
    imageProduct = json['image_product'];
    description = json['description'];
    descriptionAr = json['description_ar'];
    priceOld = json['price_old'];
    priceNew = json['price_new'];
    qunantity = json['qunantity'];
    discount = json['discount'];
    status = json['status'];
    createdAt = json['createdAt'];
    productsCategoryId = json['products_category_id'];
    productsZoneId = json['products_zone_id'];
    idCategory = json['id_category'];
    nameCategory = json['name_category'];
    imageCategory = json['image_category'];
    categoryStatus = json['category_status'];
    zoneCategory = json['zone_category'];
    zoneId = json['zone_id'];
    zoneName = json['zone_name'];
    zoneImage = json['zone_image'];
    zoneStatus = json['zone_status'];
  }

  num? idProduct;
  String? nameProduct;
  String? nameProductAr;
  String? imageProduct;
  String? description;
  String? descriptionAr;
  num? priceOld;
  num? priceNew;
  num? qunantity;
  num? discount;
  num? status;
  String? createdAt;
  num? productsCategoryId;
  num? productsZoneId;
  num? idCategory;
  String? nameCategory;
  String? imageCategory;
  num? categoryStatus;
  num? zoneCategory;
  num? zoneId;
  String? zoneName;
  String? zoneImage;
  num? zoneStatus;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id_product'] = idProduct;
    map['name_product'] = nameProduct;
    map['name_product_ar'] = nameProductAr;
    map['image_product'] = imageProduct;
    map['description'] = description;
    map['description_ar'] = descriptionAr;
    map['price_old'] = priceOld;
    map['price_new'] = priceNew;
    map['qunantity'] = qunantity;
    map['discount'] = discount;
    map['status'] = status;
    map['createdAt'] = createdAt;
    map['products_category_id'] = productsCategoryId;
    map['products_zone_id'] = productsZoneId;
    map['id_category'] = idCategory;
    map['name_category'] = nameCategory;
    map['image_category'] = imageCategory;
    map['category_status'] = categoryStatus;
    map['zone_category'] = zoneCategory;
    map['zone_id'] = zoneId;
    map['zone_name'] = zoneName;
    map['zone_image'] = zoneImage;
    map['zone_status'] = zoneStatus;
    return map;
  }
}
