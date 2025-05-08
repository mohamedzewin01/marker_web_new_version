import 'package:bloc/bloc.dart';
import 'package:fada_alhalij_web/core/common/api_result.dart';
import 'package:fada_alhalij_web/core/utils/cashed_data_shared_preferences.dart';
import 'package:fada_alhalij_web/features/cart/data/models/request/add_to_cart_request.dart';
import 'package:fada_alhalij_web/features/cart/data/models/request/update_cart_item.dart';
import 'package:fada_alhalij_web/features/cart/data/models/response/cart_dto.dart';
import 'package:fada_alhalij_web/features/cart/domain/entities/cart_entities.dart';
import 'package:fada_alhalij_web/features/cart/domain/use_cases/cart_use_case.dart';
import 'package:fada_alhalij_web/features/cart/presentation/pages/cart_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'cart_state.dart';

@injectable
class CartCubit extends Cubit<CartState> {
  CartCubit(this._cartUseCase) : super(CartInitial());
  final CartUseCase _cartUseCase;

  static CartCubit get(context) => BlocProvider.of(context);

  int? idUser = CacheService.getData(key: CacheConstants.userId) ?? 0;

  List<CartItems> cartItems = [];
  Cart? myCart;
  double total = 0;

  Future<void> getCart() async {
    emit(CartLoading());
    var result = await _cartUseCase.getCart();

    switch (result) {
      case Success<CartEntity?>():
        {
          if (!isClosed) {
            emit(CartSuccess(result.data));
          }
        }
      case Fail<CartEntity?>():
        {
          emit(CartFail(result.exception));
        }
    }
  }

  Future<void> decreaseQuantity({
    required int index,
    required int productId,
  }) async {
    if (index >= 0 && index < cartItems.length) {
      final currentQuantity = cartItems[index].quantity ?? 1;
      final updatedQuantity = currentQuantity > 1 ? currentQuantity - 1 : 1;
      var result = await _cartUseCase.updateCart(
        UpdateCartItemRequest(
          quantity: updatedQuantity,
          productId: productId,
          userId: idUser,
        ),
      );

      switch (result) {
        case Success<UpdateCartItemEntity?>():
          {
            if (!isClosed) {
              cartItems[index].quantity = updatedQuantity;
              updateCartTotals();
            }
          }
        case Fail<AddToCartRequest?>():
          {
            emit(CartAddFail());
          }
      }
    }
  }

  Future<void> increaseQuantity({
    required int index,
    required int productId,
  }) async {
    if (index >= 0 && index < cartItems.length) {
      final currentQuantity = cartItems[index].quantity ?? 1;
      final updatedQuantity = currentQuantity + 1;

      var result = await _cartUseCase.updateCart(
        UpdateCartItemRequest(
          quantity: updatedQuantity,
          productId: productId,
          userId:idUser,
        ),
      );

      switch (result) {
        case Success<UpdateCartItemEntity?>():
          {
            if (!isClosed) {
              cartItems[index].quantity = updatedQuantity;
              updateCartTotals();
            }
          }
        case Fail<AddToCartRequest?>():
          {
            emit(CartAddFail());
          }
      }
    }
  }

  ///

  void updateCartTotals() {
    double totalPrice = 0;
    double totalDiscount = 0;
    double finalPrice = 0;

    // حساب التوتال بناءً على cartItems
    for (var item in cartItems) {
      final price = item.product?.price ?? 0;
      final discount = item.product?.discount ?? 0;
      final qty = item.quantity ?? 1;

      totalPrice += price * qty;
      totalDiscount += discount * qty;
      finalPrice += (price - discount) * qty;

      print(finalPrice);
    }

    myCart = myCart?.copyWith(
      totalPrice: totalPrice,
      totalDiscount: totalDiscount,
      finalPrice: finalPrice,
    );

    emit(CartSuccess(CartEntity(cart: myCart)));
  }

  void updateCartItemQuantity(int productId, int newQuantity) async {
    await _cartUseCase.updateCart(
      UpdateCartItemRequest(quantity: newQuantity, productId: productId),
    );
  }

  void removeItemFromCart(int productId) {
    cartItems.removeWhere((item) => item.product?.id == productId);

    updateCartTotals();
  }

  Future<void> addToCart({required int idProduct}) async {
    int? userId = await CacheService.getData(key: CacheConstants.userId);
    AddToCartRequest addToCartRequest = AddToCartRequest(
      productId: idProduct,
      quantity: 1,
      userId: userId,
    );
    emit(CartAddLoading());
    var result = await _cartUseCase.addCart(addToCartRequest);

    switch (result) {
      case Success<AddToCartRequest?>():
        {
          if (!isClosed) {
            emit(CartAddSuccess());
          }
        }
      case Fail<AddToCartRequest?>():
        {
          emit(CartAddFail());
        }
    }
  }
}

// class CartCubit extends Cubit<CartState> {
//   CartCubit() : super(CartInitial());
//
//   Future<void> getCart() async {
//     emit(CartLoading());
//     try {
//       // محاكاة استدعاء API
//       await Future.delayed(const Duration(seconds: 1));
//       final Map<String, dynamic> jsonData = jsonDecode(jsonResponseString);
//       final CartResponse cartResponse = CartResponse.fromJson(jsonData);
//       // تأكد من أن النماذج تقوم بإعادة الحساب عند الإنشاء إذا لزم الأمر
//       // أو قم بإعادة الحساب هنا قبل الإرسال
//       cartResponse.cart.recalculateTotals(); // تأكد من أن هذه الدالة موجودة وتعمل
//       emit(CartLoaded(cartResponse.cart));
//     } catch (e) {
//       emit(CartError("فشل في تحميل السلة: ${e.toString()}"));
//     }
//   }
//
//
//
// // يمكنك إضافة المزيد من الدوال مثل clearCart، applyCoupon، إلخ.
// }
