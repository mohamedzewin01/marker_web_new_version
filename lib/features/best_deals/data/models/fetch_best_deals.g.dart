// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fetch_best_deals.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FetchBestDeals _$FetchBestDealsFromJson(Map<String, dynamic> json) =>
    FetchBestDeals(
      status: json['status'] as String?,
      bestDeals:
          (json['bestDeals'] as List<dynamic>?)
              ?.map((e) => AllBestDeals.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$FetchBestDealsToJson(FetchBestDeals instance) =>
    <String, dynamic>{
      'status': instance.status,
      'bestDeals': instance.bestDeals,
    };

AllBestDeals _$AllBestDealsFromJson(Map<String, dynamic> json) => AllBestDeals(
  idProduct: (json['id_product'] as num?)?.toInt(),
  productName: json['product_name'] as String?,
  productPrice: (json['product_price'] as num?)?.toDouble(),
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

Map<String, dynamic> _$AllBestDealsToJson(AllBestDeals instance) =>
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
