
import 'package:auto_size_text/auto_size_text.dart';
import 'package:fada_alhalij_web/core/di/di.dart';
import 'package:fada_alhalij_web/core/functions/is_user_logged_in.dart';
import 'package:fada_alhalij_web/core/resources/assets_manager.dart';
import 'package:fada_alhalij_web/core/resources/color_manager.dart';
import 'package:fada_alhalij_web/core/resources/style_manager.dart';
import 'package:fada_alhalij_web/core/utils/cashed_data_shared_preferences.dart';
import 'package:fada_alhalij_web/core/widgets/custom_elevated_button.dart';
import 'package:fada_alhalij_web/features/order/data/models/response/get_active_orders_dto.dart';
import 'package:fada_alhalij_web/features/order/presention/cubit/active_orders_cubit/active_orders_cubit.dart';
import 'package:fada_alhalij_web/features/order/presention/widgets/cart_active_order_item_card.dart';
import 'package:fada_alhalij_web/features/order/presention/widgets/cart_completed_order_item_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CompletedOrdersView extends StatefulWidget {
  const CompletedOrdersView({super.key});

  @override
  State<CompletedOrdersView> createState() => _CompletedOrdersViewState();
}

class _CompletedOrdersViewState extends State<CompletedOrdersView> {
  late ActiveOrdersCubit viewModel;

  @override
  void initState() {
    viewModel = getIt.get<ActiveOrdersCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: viewModel..getCompletedOrder(),
      child: BlocConsumer<ActiveOrdersCubit, ActiveOrdersState>(
        listener: (context, state) {
          // Handle listener logic here
        },
        builder: (context, state) {
          if (state is OrdersCompletedSuccess) {
            List<ActiveOrder>? cartItems =
                state.getActiveOrdersEntity.orders ?? [];
            print(cartItems.length);
            return Column(
              children: [
                Expanded(
                  child: CustomScrollView(
                    slivers: [
                      SliverToBoxAdapter(
                        child: Container(
                          margin:EdgeInsets.only(
                            top: 8,
                            right: 8,
                            left: 8,
                            bottom: 65,

                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade300),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [


                              SizedBox(height: 8),
                              ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(
                                  parent: BouncingScrollPhysics(),
                                ),
                                itemBuilder: (context, index) {
                                  return CartCompletedOrderItemCard(
                                    index: index,
                                    cartItem: cartItems[index],
                                  );
                                },
                                itemCount: cartItems.length,
                              ),

                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }
          if(state is OrdersCompletedFail){
            if (isActiveUser) {
              return SingleChildScrollView(
                child: Stack(
                  children: [
                    Image.asset(Assets.orderEmpty),
                    Positioned(
                      top: 150,
                      left: 0,
                      right: 0,

                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.sizeOf(context).width * 0.25,
                        ),

                        child: AutoSizeText(
                          'لا يوجد طلبات',
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
                    Image.asset(Assets.orderEmpty),

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

          return SizedBox();
        },
      ),
    );
  }
}
