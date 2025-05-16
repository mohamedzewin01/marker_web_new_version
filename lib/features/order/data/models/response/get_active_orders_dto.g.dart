// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_active_orders_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetActiveOrdersDto _$GetActiveOrdersDtoFromJson(Map<String, dynamic> json) =>
    GetActiveOrdersDto(
      message: json['message'] as String?,
      orders:
          (json['orders'] as List<dynamic>?)
              ?.map((e) => ActiveOrder.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$GetActiveOrdersDtoToJson(GetActiveOrdersDto instance) =>
    <String, dynamic>{'message': instance.message, 'orders': instance.orders};

ActiveOrder _$ActiveOrderFromJson(Map<String, dynamic> json) => ActiveOrder(
  orderNumber: json['order_number'] as String?,
  idOrder: (json['id_order'] as num?)?.toInt(),
  status: json['status'] as String?,
  totalPrice: (json['totalPrice'] as num?)?.toDouble(),
  orderDate: json['order_date'] as String?,
  deliveryTime: json['delivery_time'] as String?,
  isActive: (json['is_active'] as num?)?.toInt(),
  createdAt: json['created_at'] as String?,
  updatedAt: json['updated_at'] as String?,
  orderItems:
      (json['order_items'] as List<dynamic>?)
          ?.map((e) => OrderItems.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$ActiveOrderToJson(ActiveOrder instance) =>
    <String, dynamic>{
      'order_number': instance.orderNumber,
      'id_order': instance.idOrder,
      'status': instance.status,
      'totalPrice': instance.totalPrice,
      'order_date': instance.orderDate,
      'delivery_time': instance.deliveryTime,
      'is_active': instance.isActive,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'order_items': instance.orderItems,
    };

OrderItems _$OrderItemsFromJson(Map<String, dynamic> json) => OrderItems(
  productId: (json['product_id'] as num?)?.toInt(),
  title: json['title'] as String?,
  price: json['price'] as num?,
  priceAfterDiscount: json['priceAfterDiscount'] as num?,
  totalPrice: json['totalPrice'] as num?,
  discount: json['discount'] as num?,
  quantity: (json['quantity'] as num?)?.toInt(),
  imgCover: json['imgCover'] as String?,
);

Map<String, dynamic> _$OrderItemsToJson(OrderItems instance) =>
    <String, dynamic>{
      'product_id': instance.productId,
      'title': instance.title,
      'price': instance.price,
      'priceAfterDiscount': instance.priceAfterDiscount,
      'discount': instance.discount,
      'quantity': instance.quantity,
      'totalPrice': instance.totalPrice,
      'imgCover': instance.imgCover,
    };
