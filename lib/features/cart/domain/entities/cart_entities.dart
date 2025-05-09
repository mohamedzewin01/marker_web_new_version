

import 'package:fada_alhalij_web/features/cart/data/models/response/cart_dto.dart';

class AddToCartEntity {

  final String? status;
  final String? message;

  AddToCartEntity ({
    this.status,
    this.message,
  });

}

class CartEntity {
  final String? message;
  final Cart? cart;

  // Constructor
  CartEntity({
    this.message,
    this.cart,
  });

  // يمكن إضافة دالة copyWith لتسهيل التعديل على CartEntity
  CartEntity copyWith({
    String? message,
    Cart? cart,
  }) {
    return CartEntity(
      message: message ?? this.message,
      cart: cart ?? this.cart,
    );
  }
}


class UpdateCartItemEntity {

  final String? message;
  final int? quantity;

  UpdateCartItemEntity ({
    this.message,
    this.quantity,
  });


}


class DelItemCartEntity {

  final String? status;

  final String? message;

  DelItemCartEntity ({
    this.status,
    this.message,
  });


}