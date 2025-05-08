import 'package:fada_alhalij_web/features/cart/domain/entities/cart_entities.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cart_dto.g.dart';

@JsonSerializable()
class CartDto {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "cart")
  final Cart? cart;

  CartDto ({
    this.message,
    this.cart,
  });

  factory CartDto.fromJson(Map<String, dynamic> json) {
    return _$CartDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$CartDtoToJson(this);
  }
  CartEntity toCartEntities() => CartEntity(
      message: message,
      cart: cart);
}

@JsonSerializable()
class Cart {
  @JsonKey(name: "user_id")
  final int? userId;
  @JsonKey(name: "cartItems")
  final List<CartItems>? cartItems;
  @JsonKey(name: "totalPrice")
  final double? totalPrice;
  @JsonKey(name: "totalDiscount")
  final double? totalDiscount;
  @JsonKey(name: "finalPrice")
  final double? finalPrice;

  Cart ({
    this.userId,
    this.cartItems,
    this.totalPrice,
    this.totalDiscount,
    this.finalPrice,
  });
  Cart copyWith({
    int? userId,
    List<CartItems>? cartItems,
    double? totalPrice,
    double? totalDiscount,
    double? finalPrice,
  }) {
    return Cart(
      userId: userId ?? this.userId,
      cartItems: cartItems ?? this.cartItems,
      totalPrice: totalPrice ?? this.totalPrice,
      totalDiscount: totalDiscount ?? this.totalDiscount,
      finalPrice: finalPrice ?? this.finalPrice,
    );
  }
  factory Cart.fromJson(Map<String, dynamic> json) {
    return _$CartFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$CartToJson(this);
  }
}

@JsonSerializable()
class CartItems {
  @JsonKey(name: "product")
  final Product? product;
  @JsonKey(name: "totalProductPrice")
  final int? totalProductPrice;
  @JsonKey(name: "totalProductDiscount")
  final double? totalProductDiscount;
  @JsonKey(name: "totleProductPriceAfterDiscount")
  final double? totleProductPriceAfterDiscount;
  @JsonKey(name: "quantity")
   int? quantity;

  CartItems ({
    this.product,
    this.totalProductPrice,
    this.totalProductDiscount,
    this.totleProductPriceAfterDiscount,
    this.quantity,
  });

  factory CartItems.fromJson(Map<String, dynamic> json) {
    return _$CartItemsFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$CartItemsToJson(this);
  }
}

@JsonSerializable()
class Product {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "title")
  final String? title;
  @JsonKey(name: "description")
  final String? description;
  @JsonKey(name: "imgCover")
  final String? imgCover;
  @JsonKey(name: "price")
  final int? price;
  @JsonKey(name: "priceAfterDiscount")
  final double? priceAfterDiscount;
  @JsonKey(name: "discount")
  final double? discount;
  @JsonKey(name: "category")
  final int? category;
  @JsonKey(name: "createdAt")
  final String? createdAt;

  Product ({
    this.id,
    this.title,
    this.description,
    this.imgCover,
    this.price,
    this.priceAfterDiscount,
    this.discount,
    this.category,
    this.createdAt,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return _$ProductFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ProductToJson(this);
  }
}


