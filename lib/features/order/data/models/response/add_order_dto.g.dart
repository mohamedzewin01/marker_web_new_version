// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_order_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddOrderDto _$AddOrderDtoFromJson(Map<String, dynamic> json) => AddOrderDto(
  message: json['message'] as String?,
  orderId: (json['order_id'] as num?)?.toInt(),
  orderNumber: json['order_number'] as String?,
  orderDate: json['order_date'] as String?,
  deliveryTime: json['delivery_time'] as String?,
  totalPrice: (json['total_price'] as num?)?.toInt(),
  orderItems:
      (json['orderItems'] as List<dynamic>?)
          ?.map((e) => OrderItems.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$AddOrderDtoToJson(AddOrderDto instance) =>
    <String, dynamic>{
      'message': instance.message,
      'order_id': instance.orderId,
      'order_number': instance.orderNumber,
      'order_date': instance.orderDate,
      'delivery_time': instance.deliveryTime,
      'total_price': instance.totalPrice,
      'orderItems': instance.orderItems,
    };

OrderItems _$OrderItemsFromJson(Map<String, dynamic> json) => OrderItems(
  orderId: (json['order_id'] as num?)?.toInt(),
  price: (json['price'] as num?)?.toInt(),
  priceAfterDiscount: (json['priceAfterDiscount'] as num?)?.toInt(),
  discount: (json['discount'] as num?)?.toInt(),
  totalPrice: (json['totalPrice'] as num?)?.toInt(),
  quantity: (json['quantity'] as num?)?.toInt(),
  product:
      json['product'] == null
          ? null
          : Product.fromJson(json['product'] as Map<String, dynamic>),
);

Map<String, dynamic> _$OrderItemsToJson(OrderItems instance) =>
    <String, dynamic>{
      'order_id': instance.orderId,
      'price': instance.price,
      'priceAfterDiscount': instance.priceAfterDiscount,
      'discount': instance.discount,
      'totalPrice': instance.totalPrice,
      'quantity': instance.quantity,
      'product': instance.product,
    };

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
  id: (json['id'] as num?)?.toInt(),
  title: json['title'] as String?,
  description: json['description'] as String?,
  imgCover: json['imgCover'] as String?,
  price: (json['price'] as num?)?.toInt(),
  priceAfterDiscount: (json['priceAfterDiscount'] as num?)?.toInt(),
  discount: (json['discount'] as num?)?.toInt(),
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
