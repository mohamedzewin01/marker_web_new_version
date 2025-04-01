// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_model_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeModelResponseDto _$HomeModelResponseDtoFromJson(
  Map<String, dynamic> json,
) => HomeModelResponseDto(
  status: json['status'] as String?,
  data:
      json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$HomeModelResponseDtoToJson(
  HomeModelResponseDto instance,
) => <String, dynamic>{'status': instance.status, 'data': instance.data};

Data _$DataFromJson(Map<String, dynamic> json) => Data(
  status: json['status'] as String?,
  store:
      json['store'] == null
          ? null
          : Store.fromJson(json['store'] as Map<String, dynamic>),
  banner:
      json['banner'] == null
          ? null
          : Banner.fromJson(json['banner'] as Map<String, dynamic>),
  category:
      json['category'] == null
          ? null
          : Category.fromJson(json['category'] as Map<String, dynamic>),
  bestDeals:
      json['bestDeals'] == null
          ? null
          : BestDeals.fromJson(json['bestDeals'] as Map<String, dynamic>),
);

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
  'status': instance.status,
  'store': instance.store,
  'banner': instance.banner,
  'category': instance.category,
  'bestDeals': instance.bestDeals,
};

Store _$StoreFromJson(Map<String, dynamic> json) => Store(
  storeId: (json['store_id'] as num?)?.toInt(),
  storeName: json['store_name'] as String?,
  storeDescreption: json['store_descreption'] as String?,
  storeImage: json['store_image'] as String?,
  storeDiscountTitle: json['store_discount_title'] as String?,
  storePhone: json['store_phone'] as String?,
);

Map<String, dynamic> _$StoreToJson(Store instance) => <String, dynamic>{
  'store_id': instance.storeId,
  'store_name': instance.storeName,
  'store_descreption': instance.storeDescreption,
  'store_image': instance.storeImage,
  'store_discount_title': instance.storeDiscountTitle,
  'store_phone': instance.storePhone,
};

Banner _$BannerFromJson(Map<String, dynamic> json) => Banner(
  status: json['status'] as String?,
  banners:
      (json['banners'] as List<dynamic>?)
          ?.map((e) => Banners.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$BannerToJson(Banner instance) => <String, dynamic>{
  'status': instance.status,
  'banners': instance.banners,
};

Banners _$BannersFromJson(Map<String, dynamic> json) => Banners(
  bannersId: (json['banners_id'] as num?)?.toInt(),
  bannersUrlImage: json['banners_url_image'] as String?,
  bannersTitle: json['banners_title'] as String?,
  bannersDescription: json['banners_description'] as String?,
  bannersProductId: (json['banners_productId'] as num?)?.toInt(),
  bannersStatus: (json['banners_status'] as num?)?.toInt(),
  bannersCreatedAt: json['banners_created_at'] as String?,
);

Map<String, dynamic> _$BannersToJson(Banners instance) => <String, dynamic>{
  'banners_id': instance.bannersId,
  'banners_url_image': instance.bannersUrlImage,
  'banners_title': instance.bannersTitle,
  'banners_description': instance.bannersDescription,
  'banners_productId': instance.bannersProductId,
  'banners_status': instance.bannersStatus,
  'banners_created_at': instance.bannersCreatedAt,
};

Category _$CategoryFromJson(Map<String, dynamic> json) => Category(
  status: json['status'] as String?,
  categories:
      (json['categories'] as List<dynamic>?)
          ?.map((e) => Categories.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
  'status': instance.status,
  'categories': instance.categories,
};

Categories _$CategoriesFromJson(Map<String, dynamic> json) => Categories(
  categoryId: (json['category_id'] as num?)?.toInt(),
  categoryName: json['category_name'] as String?,
  categoryImage: json['category_image'] as String?,
  categoryStatus: (json['category_status'] as num?)?.toInt(),
  categoryCreatAt: json['category_creatAt'] as String?,
);

Map<String, dynamic> _$CategoriesToJson(Categories instance) =>
    <String, dynamic>{
      'category_id': instance.categoryId,
      'category_name': instance.categoryName,
      'category_image': instance.categoryImage,
      'category_status': instance.categoryStatus,
      'category_creatAt': instance.categoryCreatAt,
    };

BestDeals _$BestDealsFromJson(Map<String, dynamic> json) => BestDeals(
  status: json['status'] as String?,
  productsBestDeals:
      (json['productsBestDeals'] as List<dynamic>?)
          ?.map((e) => ProductsBestDeals.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$BestDealsToJson(BestDeals instance) => <String, dynamic>{
  'status': instance.status,
  'productsBestDeals': instance.productsBestDeals,
};

ProductsBestDeals _$ProductsBestDealsFromJson(Map<String, dynamic> json) =>
    ProductsBestDeals(
      idProduct: (json['id_product'] as num?)?.toInt(),
      productName: json['product_name'] as String?,
      productPrice: (json['product_price'] as num?)?.toInt(),
      description: json['description'] as String?,
      imageCover: json['image_cover'] as String?,
      productPriceAfterDiscount:
          (json['product_price_after_discount'] as num?)?.toDouble(),
      category: (json['category'] as num?)?.toInt(),
      descount: (json['descount'] as num?)?.toInt(),
      status: (json['status'] as num?)?.toInt(),
      dateDescount: json['date_descount'] as String?,
      createdAt: json['createdAt'] as String?,
      categoryId: (json['category_id'] as num?)?.toInt(),
      categoryName: json['category_name'] as String?,
      categoryImage: json['category_image'] as String?,
      categoryStatus: (json['category_status'] as num?)?.toInt(),
      categoryCreatAt: json['category_creatAt'] as String?,
    );

Map<String, dynamic> _$ProductsBestDealsToJson(ProductsBestDeals instance) =>
    <String, dynamic>{
      'id_product': instance.idProduct,
      'product_name': instance.productName,
      'product_price': instance.productPrice,
      'description': instance.description,
      'image_cover': instance.imageCover,
      'product_price_after_discount': instance.productPriceAfterDiscount,
      'category': instance.category,
      'descount': instance.descount,
      'status': instance.status,
      'date_descount': instance.dateDescount,
      'createdAt': instance.createdAt,
      'category_id': instance.categoryId,
      'category_name': instance.categoryName,
      'category_image': instance.categoryImage,
      'category_status': instance.categoryStatus,
      'category_creatAt': instance.categoryCreatAt,
    };
