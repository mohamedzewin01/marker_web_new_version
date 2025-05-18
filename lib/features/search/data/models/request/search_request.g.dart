// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchRequest _$SearchRequestFromJson(Map<String, dynamic> json) =>
    SearchRequest(
      search: json['search'] as String?,
      categoryId: (json['category_id'] as num?)?.toInt(),
      minPrice: (json['min_price'] as num?)?.toInt(),
      maxPrice: (json['max_price'] as num?)?.toInt(),
      sortBy: json['sort_by'] as String?,
      order: json['order'] as String?,
      pagination: json['pagination'] as bool?,
      page: (json['page'] as num?)?.toInt(),
      limit: (json['limit'] as num?)?.toInt(),
    );

Map<String, dynamic> _$SearchRequestToJson(SearchRequest instance) =>
    <String, dynamic>{
      'search': instance.search,
      'category_id': instance.categoryId,
      'min_price': instance.minPrice,
      'max_price': instance.maxPrice,
      'sort_by': instance.sortBy,
      'order': instance.order,
      'pagination': instance.pagination,
      'page': instance.page,
      'limit': instance.limit,
    };
