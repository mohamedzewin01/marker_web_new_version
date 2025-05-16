// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_order_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddOrderRequest _$AddOrderRequestFromJson(Map<String, dynamic> json) =>
    AddOrderRequest(
      userId: (json['user_id'] as num?)?.toInt(),
      userAddress: (json['user_address'] as num?)?.toInt(),
    );

Map<String, dynamic> _$AddOrderRequestToJson(AddOrderRequest instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'user_address': instance.userAddress,
    };
