// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_order_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddOrderDto _$AddOrderDtoFromJson(Map<String, dynamic> json) => AddOrderDto(
  message: json['message'] as String?,
  order:
      json['order'] == null
          ? null
          : Order.fromJson(json['order'] as Map<String, dynamic>),
);

Map<String, dynamic> _$AddOrderDtoToJson(AddOrderDto instance) =>
    <String, dynamic>{'message': instance.message, 'order': instance.order};

Order _$OrderFromJson(Map<String, dynamic> json) => Order(
  user: (json['user'] as num?)?.toInt(),
  orderItems:
      (json['orderItems'] as List<dynamic>?)
          ?.map((e) => OrderItems.fromJson(e as Map<String, dynamic>))
          .toList(),
  totalPrice: (json['totalPrice'] as num?)?.toInt(),
  paymentType: json['paymentType'] as String?,
  isPaid: json['isPaid'] as bool?,
  isDelivered: json['isDelivered'] as bool?,
  state: json['state'] as String?,
  orderNumber: json['orderNumber'] as String?,
  createdAt: json['createdAt'] as String?,
  updatedAt: json['updatedAt'] as String?,
);

Map<String, dynamic> _$OrderToJson(Order instance) => <String, dynamic>{
  'user': instance.user,
  'orderItems': instance.orderItems,
  'totalPrice': instance.totalPrice,
  'paymentType': instance.paymentType,
  'isPaid': instance.isPaid,
  'isDelivered': instance.isDelivered,
  'state': instance.state,
  'orderNumber': instance.orderNumber,
  'createdAt': instance.createdAt,
  'updatedAt': instance.updatedAt,
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
