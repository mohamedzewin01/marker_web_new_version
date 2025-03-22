import 'package:json_annotation/json_annotation.dart';

import '../../../domain/entities/home_entities.dart';

part 'home_model_response_dto.g.dart';

@JsonSerializable()
class HomeModelResponseDto {
  @JsonKey(name: "status")
  final String? status;
  @JsonKey(name: "data")
  final Data? data;

  HomeModelResponseDto ({
    this.status,
    this.data,
  });

  factory HomeModelResponseDto.fromJson(Map<String, dynamic> json) {
    return _$HomeModelResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$HomeModelResponseDtoToJson(this);
  }
  HomeEntity toHomeEntity(){
    return HomeEntity(
      status: status,
      data: data,
    );
  }
}

@JsonSerializable()
class Data {
  @JsonKey(name: "status")
  final String? status;
  @JsonKey(name: "store")
  final Store? store;
  @JsonKey(name: "category")
  final Category? category;
  @JsonKey(name: "bestDeals")
  final BestDeals? bestDeals;

  Data ({
    this.status,
    this.store,
    this.category,
    this.bestDeals,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return _$DataFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$DataToJson(this);
  }

}

@JsonSerializable()
class Store {
  @JsonKey(name: "store_id")
  final int? storeId;
  @JsonKey(name: "store_name")
  final String? storeName;
  @JsonKey(name: "store_descreption")
  final String? storeDescreption;
  @JsonKey(name: "store_image")
  final String? storeImage;
  @JsonKey(name: "store_discount_title")
  final String? storeDiscountTitle;

  Store ({
    this.storeId,
    this.storeName,
    this.storeDescreption,
    this.storeImage,
    this.storeDiscountTitle,
  });

  factory Store.fromJson(Map<String, dynamic> json) {
    return _$StoreFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$StoreToJson(this);
  }
}

@JsonSerializable()
class Category {
  @JsonKey(name: "status")
  final String? status;
  @JsonKey(name: "categories")
  final List<Categories>? categories;

  Category ({
    this.status,
    this.categories,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return _$CategoryFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$CategoryToJson(this);
  }
}

@JsonSerializable()
class Categories {
  @JsonKey(name: "category_id")
  final int? categoryId;
  @JsonKey(name: "category_name")
  final String? categoryName;
  @JsonKey(name: "category_image")
  final String? categoryImage;
  @JsonKey(name: "category_status")
  final int? categoryStatus;
  @JsonKey(name: "category_creatAt")
  final String? categoryCreatAt;

  Categories ({
    this.categoryId,
    this.categoryName,
    this.categoryImage,
    this.categoryStatus,
    this.categoryCreatAt,
  });

  factory Categories.fromJson(Map<String, dynamic> json) {
    return _$CategoriesFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$CategoriesToJson(this);
  }
}

@JsonSerializable()
class BestDeals {
  @JsonKey(name: "status")
  final String? status;
  @JsonKey(name: "productsBestDeals")
  final List<ProductsBestDeals>? productsBestDeals;

  BestDeals ({
    this.status,
    this.productsBestDeals,
  });

  factory BestDeals.fromJson(Map<String, dynamic> json) {
    return _$BestDealsFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$BestDealsToJson(this);
  }
}

@JsonSerializable()
class ProductsBestDeals {
  @JsonKey(name: "id_product")
  final int? idProduct;
  @JsonKey(name: "product_name")
  final String? productName;
  @JsonKey(name: "product_price")
  final int? productPrice;
  @JsonKey(name: "description")
  final String? description;
  @JsonKey(name: "image_cover")
  final String? imageCover;
  @JsonKey(name: "product_price_after_discount")
  final double? productPriceAfterDiscount;
  @JsonKey(name: "category")
  final int? category;
  @JsonKey(name: "descount")
  final int? descount;
  @JsonKey(name: "status")
  final int? status;
  @JsonKey(name: "date_descount")
  final String? dateDescount;
  @JsonKey(name: "createdAt")
  final String? createdAt;
  @JsonKey(name: "category_id")
  final int? categoryId;
  @JsonKey(name: "category_name")
  final String? categoryName;
  @JsonKey(name: "category_image")
  final String? categoryImage;
  @JsonKey(name: "category_status")
  final int? categoryStatus;
  @JsonKey(name: "category_creatAt")
  final String? categoryCreatAt;

  ProductsBestDeals ({
    this.idProduct,
    this.productName,
    this.productPrice,
    this.description,
    this.imageCover,
    this.productPriceAfterDiscount,
    this.category,
    this.descount,
    this.status,
    this.dateDescount,
    this.createdAt,
    this.categoryId,
    this.categoryName,
    this.categoryImage,
    this.categoryStatus,
    this.categoryCreatAt,
  });

  factory ProductsBestDeals.fromJson(Map<String, dynamic> json) {
    return _$ProductsBestDealsFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ProductsBestDealsToJson(this);
  }
}


