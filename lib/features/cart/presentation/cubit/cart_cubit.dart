import 'package:bloc/bloc.dart';
import 'package:fada_alhalij_web/core/common/api_result.dart';
import 'package:fada_alhalij_web/core/utils/cashed_data_shared_preferences.dart';
import 'package:fada_alhalij_web/features/cart/data/models/request/add_to_cart_request.dart';
import 'package:fada_alhalij_web/features/cart/domain/use_cases/cart_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'cart_state.dart';
@injectable
class CartCubit extends Cubit<CartState> {
  CartCubit(this._cartUseCase) : super(CartInitial());
  final CartUseCase _cartUseCase;


static CartCubit get(context) => BlocProvider.of(context);

  Future<void> addToCart({required int idProduct}) async {
    String userId = await CacheService.getData(key: CacheConstants.userId);
    AddToCartRequest addToCartRequest = AddToCartRequest(
      productId: idProduct,
      quantity: 1,
      userId: int.parse(userId),
    );
    emit(CartAddLoading());
    var result = _cartUseCase.addCart(addToCartRequest);

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
