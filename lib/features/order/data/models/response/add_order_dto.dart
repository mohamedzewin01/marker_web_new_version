import 'package:fada_alhalij_web/features/order/domain/entities/orders_entities.dart';
import 'package:json_annotation/json_annotation.dart';

part 'add_order_dto.g.dart';

@JsonSerializable()
class AddOrderDto {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "order")
  final Order? order;

  AddOrderDto ({
    this.message,
    this.order,
  });

  factory AddOrderDto.fromJson(Map<String, dynamic> json) {
    return _$AddOrderDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$AddOrderDtoToJson(this);
  }
  AddOrderEntity toAddOrderEntity() {
    return AddOrderEntity(message: message,order: order);
  }
}

@JsonSerializable()
class Order {
  @JsonKey(name: "user")
  final int? user;
  @JsonKey(name: "orderItems")
  final List<OrderItems>? orderItems;
  @JsonKey(name: "totalPrice")
  final int? totalPrice;
  @JsonKey(name: "paymentType")
  final String? paymentType;
  @JsonKey(name: "isPaid")
  final bool? isPaid;
  @JsonKey(name: "isDelivered")
  final bool? isDelivered;
  @JsonKey(name: "state")
  final String? state;
  @JsonKey(name: "orderNumber")
  final String? orderNumber;
  @JsonKey(name: "createdAt")
  final String? createdAt;
  @JsonKey(name: "updatedAt")
  final String? updatedAt;

  Order ({
    this.user,
    this.orderItems,
    this.totalPrice,
    this.paymentType,
    this.isPaid,
    this.isDelivered,
    this.state,
    this.orderNumber,
    this.createdAt,
    this.updatedAt,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return _$OrderFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$OrderToJson(this);
  }
}

@JsonSerializable()
class OrderItems {
  @JsonKey(name: "order_id")
  final int? orderId;
  @JsonKey(name: "price")
  final int? price;
  @JsonKey(name: "priceAfterDiscount")
  final int? priceAfterDiscount;
  @JsonKey(name: "discount")
  final int? discount;
  @JsonKey(name: "totalPrice")
  final int? totalPrice;
  @JsonKey(name: "quantity")
  final int? quantity;
  @JsonKey(name: "product")
  final Product? product;

  OrderItems ({
    this.orderId,
    this.price,
    this.priceAfterDiscount,
    this.discount,
    this.totalPrice,
    this.quantity,
    this.product,
  });

  factory OrderItems.fromJson(Map<String, dynamic> json) {
    return _$OrderItemsFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$OrderItemsToJson(this);
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
  final int? priceAfterDiscount;
  @JsonKey(name: "discount")
  final int? discount;
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


