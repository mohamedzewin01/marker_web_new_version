import 'package:json_annotation/json_annotation.dart';

part 'search_request.g.dart';

@JsonSerializable()
class SearchRequest {
  @JsonKey(name: "search")
  final String? search;
  @JsonKey(name: "category_id")
  final int? categoryId;
  @JsonKey(name: "min_price")
  final int? minPrice;
  @JsonKey(name: "max_price")
  final int? maxPrice;
  @JsonKey(name: "sort_by")
  final String? sortBy;
  @JsonKey(name: "order")
  final String? order;
  @JsonKey(name: "pagination")
  final bool? pagination;
  @JsonKey(name: "page")
  final int? page;
  @JsonKey(name: "limit")
  final int? limit;

  SearchRequest ({
    this.search,
    this.categoryId,
    this.minPrice,
    this.maxPrice,
    this.sortBy,
    this.order,
    this.pagination,
    this.page,
    this.limit,
  });

  factory SearchRequest.fromJson(Map<String, dynamic> json) {
    return _$SearchRequestFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$SearchRequestToJson(this);
  }
}


