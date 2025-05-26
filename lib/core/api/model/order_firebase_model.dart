

import 'package:json_annotation/json_annotation.dart';
part 'order_firebase_model.g.dart';


@JsonSerializable(explicitToJson: true)
class OrdersFirebaseModel {
  @JsonKey(name: "order_number")
  final String? orderNumber;
  @JsonKey(name: "id_order")
  final int? idOrder;
  @JsonKey(name: "status")
  final String? status;
  @JsonKey(name: "totalPrice")
  final double? totalPrice;
  @JsonKey(name: "order_date")
  final String? orderDate;
  @JsonKey(name: "delivery_time")
  final String? deliveryTime;
  @JsonKey(name: "is_active")
  final int? isActive;
  @JsonKey(name: "created_at")
  final String? createdAt;
  @JsonKey(name: "updated_at")
  final String? updatedAt;
  @JsonKey(name: "order_items")
  final List<OrderItems>? orderItems;
  @JsonKey(name: "user")
  final User? user;
  @JsonKey(name: "user_address")
  final UserAddress? userAddress;
  @JsonKey(name: "acceptedAt")
  final String? acceptedAt;

  @JsonKey(name: "preparingAt")
  final String? preparingAt;

  @JsonKey(name: "outDeliveryAt")
  final String? outDeliveryAt;


  @JsonKey(name: "delivery")
  final Delivery? delivery;



  OrdersFirebaseModel({
    this.orderNumber,
    this.idOrder,
    this.status,
    this.totalPrice,
    this.orderDate,
    this.deliveryTime,
    this.isActive,
    this.createdAt,
    this.updatedAt,
    this.orderItems,
    this.user,
    this.userAddress,
    this.delivery,
    this.acceptedAt,
    this.preparingAt,
    this.outDeliveryAt
  });

  factory OrdersFirebaseModel.fromJson(Map<String, dynamic> json) {
    return _$OrdersFirebaseModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$OrdersFirebaseModelToJson(this);
  }
}

@JsonSerializable()
class OrderItems {
  @JsonKey(name: "product_id")
  final int? productId;
  @JsonKey(name: "title")
  final String? title;
  @JsonKey(name: "price")
  final int? price;
  @JsonKey(name: "priceAfterDiscount")
  final int? priceAfterDiscount;
  @JsonKey(name: "discount")
  final int? discount;
  @JsonKey(name: "quantity")
  final int? quantity;
  @JsonKey(name: "totalPrice")
  final int? totalPrice;
  @JsonKey(name: "imgCover")
  final String? imgCover;

  OrderItems({
    this.productId,
    this.title,
    this.price,
    this.priceAfterDiscount,
    this.discount,
    this.quantity,
    this.totalPrice,
    this.imgCover,
  });

  factory OrderItems.fromJson(Map<String, dynamic> json) {
    return _$OrderItemsFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$OrderItemsToJson(this);
  }
}

@JsonSerializable()
class User {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "phone")
  final String? phone;
  @JsonKey(name: "email")
  final String? email;

  User({this.id, this.name, this.phone, this.email});

  factory User.fromJson(Map<String, dynamic> json) {
    return _$UserFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$UserToJson(this);
  }
}

@JsonSerializable()
class UserAddress {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "title")
  final String? title;
  @JsonKey(name: "street")
  final String? street;
  @JsonKey(name: "city")
  final String? city;
  @JsonKey(name: "lat")
  final String? lat;
  @JsonKey(name: "long")
  final String? long;
  @JsonKey(name: "details")
  final String? details;
  @JsonKey(name: "delivery_area_id")
  final int? deliveryAreaId;
  @JsonKey(name: "isActive")
  final int? isActive;
  @JsonKey(name: "created_at")
  final String? createdAt;

  UserAddress({
    this.id,
    this.title,
    this.street,
    this.city,
    this.lat,
    this.long,
    this.details,
    this.deliveryAreaId,
    this.isActive,
    this.createdAt,
  });

  factory UserAddress.fromJson(Map<String, dynamic> json) {
    return _$UserAddressFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$UserAddressToJson(this);
  }
}


@JsonSerializable()
class Delivery {
  Delivery({

    this.name,

    this.phone,
    this.photo,
    this.idDelivery,
    this.lat,
    this.long,

  });

  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "phone")
  String? phone;
  @JsonKey(name: "photo")
  String? photo;
  @JsonKey(name: "lat")
  String? lat;
  @JsonKey(name: "long")
  String? long;
  @JsonKey(name: "id_driver")
  String? idDelivery;

  factory Delivery.fromJson(Map<String, dynamic> json) {
    return _$DeliveryFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$DeliveryToJson(this);
  }
}