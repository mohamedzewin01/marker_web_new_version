// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartDto _$CartDtoFromJson(Map<String, dynamic> json) => CartDto(
  message: json['message'] as String?,
  cart:
      json['cart'] == null
          ? null
          : Cart.fromJson(json['cart'] as Map<String, dynamic>),
);

Map<String, dynamic> _$CartDtoToJson(CartDto instance) => <String, dynamic>{
  'message': instance.message,
  'cart': instance.cart,
};

Cart _$CartFromJson(Map<String, dynamic> json) => Cart(
  userId: (json['user_id'] as num?)?.toInt(),
  cartItems:
      (json['cartItems'] as List<dynamic>?)
          ?.map((e) => CartItems.fromJson(e as Map<String, dynamic>))
          .toList(),
  totalPrice: json['totalPrice'] as num?,
  totalDiscount: json['totalDiscount'] as num?,
  finalPrice: json['finalPrice'] as num?,
);

Map<String, dynamic> _$CartToJson(Cart instance) => <String, dynamic>{
  'user_id': instance.userId,
  'cartItems': instance.cartItems,
  'totalPrice': instance.totalPrice,
  'totalDiscount': instance.totalDiscount,
  'finalPrice': instance.finalPrice,
};

CartItems _$CartItemsFromJson(Map<String, dynamic> json) => CartItems(
  product:
      json['product'] == null
          ? null
          : Product.fromJson(json['product'] as Map<String, dynamic>),
  totalProductPrice: (json['totalProductPrice'] as num?)?.toDouble(),
  totalProductDiscount: (json['totalProductDiscount'] as num?)?.toDouble(),
  totleProductPriceAfterDiscount:
      (json['totleProductPriceAfterDiscount'] as num?)?.toDouble(),
  quantity: (json['quantity'] as num?)?.toInt(),
);

Map<String, dynamic> _$CartItemsToJson(CartItems instance) => <String, dynamic>{
  'product': instance.product,
  'totalProductPrice': instance.totalProductPrice,
  'totalProductDiscount': instance.totalProductDiscount,
  'totleProductPriceAfterDiscount': instance.totleProductPriceAfterDiscount,
  'quantity': instance.quantity,
};

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
  id: (json['id'] as num?)?.toInt(),
  title: json['title'] as String?,
  description: json['description'] as String?,
  imgCover: json['imgCover'] as String?,
  price: (json['price'] as num?)?.toDouble(),
  priceAfterDiscount: (json['priceAfterDiscount'] as num?)?.toDouble(),
  discount: (json['discount'] as num?)?.toDouble(),
  category: (json['category'] as num?)?.toInt(),
  createdAt: json['createdAt'] as String?,
);

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'description': instance.description,
  'imgCover': instance.imgCover,
  'price': instance.price,
  'priceAfterDiscount': instance.priceAfterDiscount,
  'discount': instance.discount,
  'category': instance.category,
  'createdAt': instance.createdAt,
};
