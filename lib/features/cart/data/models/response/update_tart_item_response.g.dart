// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_tart_item_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateCartItemResponseDto _$UpdateCartItemResponseDtoFromJson(
  Map<String, dynamic> json,
) => UpdateCartItemResponseDto(
  message: json['message'] as String?,
  userId: (json['user_id'] as num?)?.toInt(),
  productId: (json['product_id'] as num?)?.toInt(),
  quantity: (json['quantity'] as num?)?.toInt(),
);

Map<String, dynamic> _$UpdateCartItemResponseDtoToJson(
  UpdateCartItemResponseDto instance,
) => <String, dynamic>{
  'message': instance.message,
  'user_id': instance.userId,
  'product_id': instance.productId,
  'quantity': instance.quantity,
};
