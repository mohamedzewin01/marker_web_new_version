// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_item_cart_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeleteItemCartRequest _$DeleteItemCartRequestFromJson(
  Map<String, dynamic> json,
) => DeleteItemCartRequest(
  userId: (json['user_id'] as num?)?.toInt(),
  productId: (json['product_id'] as num?)?.toInt(),
);

Map<String, dynamic> _$DeleteItemCartRequestToJson(
  DeleteItemCartRequest instance,
) => <String, dynamic>{
  'user_id': instance.userId,
  'product_id': instance.productId,
};
