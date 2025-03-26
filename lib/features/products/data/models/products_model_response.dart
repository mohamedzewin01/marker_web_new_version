import 'package:fada_alhalij_web/features/products/domain/entities/products_entities.dart';

class ProductsModelResponse {
  ProductsData? productsData;
   ProductsModelResponse({this.productsData});
   ProductsModelResponse.fromJson(
      Map<String, dynamic> json) {
    productsData = json['productsData'] != null
        ? ProductsData.fromJson(json['productsData'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (productsData != null) {
      data['productsData'] = productsData!.toJson();
    }
    return data;
  }
  ProductsModelEntity toProductsModelEntity() =>
      ProductsModelEntity(productsData: productsData);
}

class ProductsData {
  String? status;
  List<ProductsRelations>? productsRelations;

  ProductsData({status, productsRelations});

  ProductsData.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['productsRelations'] != null) {
      productsRelations = <ProductsRelations>[];
      json['productsRelations'].forEach((v) {
        productsRelations!.add(ProductsRelations.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (productsRelations != null) {
      data['productsRelations'] =
          productsRelations!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProductsRelations {
  int? idProduct;
  String? productName;
  int? productPrice;
  String? description;
  String? imageCover;
  double? productPriceAfterDiscount;
  int? category;
  int? descount;
  int? status;
  String? dateDescount;
  String? createdAt;
  int? categoryId;
  String? categoryName;
  String? categoryImage;
  int? categoryStatus;
  String? categoryCreatAt;

  ProductsRelations(
      {this.idProduct,
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
        this.categoryCreatAt});

  ProductsRelations.fromJson(Map<String, dynamic> json) {
    idProduct = json['id_product'];
    productName = json['product_name'];
    productPrice = json['product_price'];
    description = json['description'];
    imageCover = json['image_cover'];
    productPriceAfterDiscount = json['product_price_after_discount'];
    category = json['category'];
    descount = json['descount'];
    status = json['status'];
    dateDescount = json['date_descount'];
    createdAt = json['createdAt'];
    categoryId = json['category_id'];
    categoryName = json['category_name'];
    categoryImage = json['category_image'];
    categoryStatus = json['category_status'];
    categoryCreatAt = json['category_creatAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id_product'] = idProduct;
    data['product_name'] = productName;
    data['product_price'] = productPrice;
    data['description'] = description;
    data['image_cover'] = imageCover;
    data['product_price_after_discount'] = productPriceAfterDiscount;
    data['category'] = category;
    data['descount'] = descount;
    data['status'] = status;
    data['date_descount'] = dateDescount;
    data['createdAt'] = createdAt;
    data['category_id'] = categoryId;
    data['category_name'] = categoryName;
    data['category_image'] = categoryImage;
    data['category_status'] = categoryStatus;
    data['category_creatAt'] = categoryCreatAt;
    return data;
  }
}
