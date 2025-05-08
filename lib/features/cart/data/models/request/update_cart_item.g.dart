// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_cart_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateCartItemRequest _$UpdateCartItemRequestFromJson(
  Map<String, dynamic> json,
) => UpdateCartItemRequest(
  userId: (json['user_id'] as num?)?.toInt(),
  productId: (json['product_id'] as num?)?.toInt(),
  quantity: (json['quantity'] as num?)?.toInt(),
);

Map<String, dynamic> _$UpdateCartItemRequestToJson(
  UpdateCartItemRequest instance,
) => <String, dynamic>{
  'user_id': instance.userId,
  'product_id': instance.productId,
  'quantity': instance.quantity,
};
