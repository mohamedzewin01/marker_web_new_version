import 'package:fada_alhalij_web/features/order/domain/entities/orders_entities.dart';
import 'package:json_annotation/json_annotation.dart';

part 'add_order_dto.g.dart';

@JsonSerializable()
class AddOrderDto {
  @JsonKey(name: "message")
  final String? message;

  AddOrderDto ({
    this.message,
  });

  factory AddOrderDto.fromJson(Map<String, dynamic> json) {
    return _$AddOrderDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$AddOrderDtoToJson(this);
  }
  AddOrderEntity toAddOrderEntity() {
    return AddOrderEntity(message: message);
  }
}


