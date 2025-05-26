// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_firebase_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrdersFirebaseModel _$OrdersFirebaseModelFromJson(Map<String, dynamic> json) =>
    OrdersFirebaseModel(
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
      user:
          json['user'] == null
              ? null
              : User.fromJson(json['user'] as Map<String, dynamic>),
      userAddress:
          json['user_address'] == null
              ? null
              : UserAddress.fromJson(
                json['user_address'] as Map<String, dynamic>,
              ),
      delivery:
          json['delivery'] == null
              ? null
              : Delivery.fromJson(json['delivery'] as Map<String, dynamic>),
      acceptedAt: json['acceptedAt'] as String?,
      preparingAt: json['preparingAt'] as String?,
      outDeliveryAt: json['outDeliveryAt'] as String?,
    );

Map<String, dynamic> _$OrdersFirebaseModelToJson(
  OrdersFirebaseModel instance,
) => <String, dynamic>{
  'order_number': instance.orderNumber,
  'id_order': instance.idOrder,
  'status': instance.status,
  'totalPrice': instance.totalPrice,
  'order_date': instance.orderDate,
  'delivery_time': instance.deliveryTime,
  'is_active': instance.isActive,
  'created_at': instance.createdAt,
  'updated_at': instance.updatedAt,
  'order_items': instance.orderItems?.map((e) => e.toJson()).toList(),
  'user': instance.user?.toJson(),
  'user_address': instance.userAddress?.toJson(),
  'acceptedAt': instance.acceptedAt,
  'preparingAt': instance.preparingAt,
  'outDeliveryAt': instance.outDeliveryAt,
  'delivery': instance.delivery?.toJson(),
};

OrderItems _$OrderItemsFromJson(Map<String, dynamic> json) => OrderItems(
  productId: (json['product_id'] as num?)?.toInt(),
  title: json['title'] as String?,
  price: (json['price'] as num?)?.toInt(),
  priceAfterDiscount: (json['priceAfterDiscount'] as num?)?.toInt(),
  discount: (json['discount'] as num?)?.toInt(),
  quantity: (json['quantity'] as num?)?.toInt(),
  totalPrice: (json['totalPrice'] as num?)?.toInt(),
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

User _$UserFromJson(Map<String, dynamic> json) => User(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  phone: json['phone'] as String?,
  email: json['email'] as String?,
);

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'phone': instance.phone,
  'email': instance.email,
};

UserAddress _$UserAddressFromJson(Map<String, dynamic> json) => UserAddress(
  id: (json['id'] as num?)?.toInt(),
  title: json['title'] as String?,
  street: json['street'] as String?,
  city: json['city'] as String?,
  lat: json['lat'] as String?,
  long: json['long'] as String?,
  details: json['details'] as String?,
  deliveryAreaId: (json['delivery_area_id'] as num?)?.toInt(),
  isActive: (json['isActive'] as num?)?.toInt(),
  createdAt: json['created_at'] as String?,
);

Map<String, dynamic> _$UserAddressToJson(UserAddress instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'street': instance.street,
      'city': instance.city,
      'lat': instance.lat,
      'long': instance.long,
      'details': instance.details,
      'delivery_area_id': instance.deliveryAreaId,
      'isActive': instance.isActive,
      'created_at': instance.createdAt,
    };

Delivery _$DeliveryFromJson(Map<String, dynamic> json) => Delivery(
  name: json['name'] as String?,
  phone: json['phone'] as String?,
  photo: json['photo'] as String?,
  idDelivery: json['id_driver'] as String?,
  lat: json['lat'] as String?,
  long: json['long'] as String?,
);

Map<String, dynamic> _$DeliveryToJson(Delivery instance) => <String, dynamic>{
  'name': instance.name,
  'phone': instance.phone,
  'photo': instance.photo,
  'lat': instance.lat,
  'long': instance.long,
  'id_driver': instance.idDelivery,
};
