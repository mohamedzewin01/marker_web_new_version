import 'package:auto_size_text/auto_size_text.dart';
import 'package:fada_alhalij_web/core/functions/is_user_logged_in.dart';
import 'package:fada_alhalij_web/core/resources/assets_manager.dart';
import 'package:fada_alhalij_web/core/resources/cashed_image.dart';
import 'package:fada_alhalij_web/core/resources/color_manager.dart';
import 'package:fada_alhalij_web/core/resources/style_manager.dart';
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
  const CartBody({super.key, required this.viewModel});

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
                return SingleChildScrollView(
                  child: Stack(
                    children: [
                      Image.asset(Assets.cartEmpty),
                      Positioned(
                        top: 150,
                        left: 0,
                        right: 0,
                  
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: MediaQuery.sizeOf(context).width * 0.25,
                          ),
                  
                          child: AutoSizeText(
                            'لا يوجد عناصر في السلة',
                            textAlign: TextAlign.center,
                            style: getSemiBoldStyle(
                              color: ColorManager.primaryColor,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                return SingleChildScrollView(
                  child: Stack(
                    children: [
                      Image.asset(Assets.cartEmpty),
                  
                      Positioned(
                        top: 150,
                        left: 0,
                        right: 0,
                  
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: MediaQuery.sizeOf(context).width * 0.25,
                          ),
                  
                          child: Column(
                            children: [
                              AutoSizeText(
                                'قم بالتسجيل الدخول للمتابعة',
                                textAlign: TextAlign.center,
                                style: getSemiBoldStyle(
                                  color: ColorManager.primaryColor,
                                  fontSize: 20,
                                ),
                              ),
                              SizedBox(height: 20,),
                              CustomElevatedButton(
                                buttonColor: ColorManager.primaryColor,
                                title: "تسجيل دخول",
                                onPressed: () {
                                  showAuthOrAddToCartDialog(context);
                                },
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }
            }
            return CircularProgressIndicator(color: ColorManager.primaryColor);
          },
        ),
      ],
    );
  }
}
