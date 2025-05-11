import 'package:fada_alhalij_web/core/functions/is_user_logged_in.dart';
import 'package:fada_alhalij_web/core/resources/color_manager.dart';
import 'package:fada_alhalij_web/core/utils/cashed_data_shared_preferences.dart';
import 'package:fada_alhalij_web/core/widgets/custom_elevated_button.dart';
import 'package:fada_alhalij_web/features/cart/data/models/response/cart_dto.dart';
import 'package:fada_alhalij_web/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:fada_alhalij_web/features/cart/presentation/widgets/cart_items_list_section.dart';
import 'package:fada_alhalij_web/features/cart/presentation/widgets/cart_summary_section.dart';
import 'package:fada_alhalij_web/features/cart/presentation/widgets/skeletonizer_cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartBody extends StatelessWidget {
  const CartBody({
    super.key,
    required this.viewModel,
  });

  final CartCubit viewModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocConsumer<CartCubit, CartState>(
          listener: (context, state) {
            // Handle listener logic here
          },
          builder: (context, state) {
            viewModel.cartItems.clear();
            if (state is CartSuccess) {
              List<CartItems>? cartItems =
                  state.cartEntity?.cart?.cartItems ?? [];
              viewModel.cartItems.addAll(cartItems);
              viewModel.myCart = state.cartEntity?.cart?.copyWith(
                finalPrice: state.cartEntity?.cart?.finalPrice,
              );
              return Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomScrollView(
                    slivers: [
                      CartItemsListSection(viewModel: viewModel),
                      CartSummarySection(viewModel: viewModel),
                    ],
                  ),
                ),
              );
            }
            if (state is CartLoading) {
              return SkeCart();
            }
            if (state is CartFail) {
              if (isActiveUser) {
                return Text('السلة فارغة');
              } else {
                return CustomElevatedButton(
                  buttonColor: ColorManager.orange,
                  title: "تسجيل دخول",
                  onPressed: () {
                    showAuthOrAddToCartDialog(context);
                  },
                );
              }
            }
            return CircularProgressIndicator(
                color: ColorManager.orange);
          },
        ),
      ],
    );
  }
}