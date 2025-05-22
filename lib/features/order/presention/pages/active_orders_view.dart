import 'package:auto_size_text/auto_size_text.dart';
import 'package:fada_alhalij_web/core/di/di.dart';
import 'package:fada_alhalij_web/core/functions/is_user_logged_in.dart';
import 'package:fada_alhalij_web/core/resources/assets_manager.dart';
import 'package:fada_alhalij_web/core/resources/cashed_image.dart';
import 'package:fada_alhalij_web/core/resources/color_manager.dart';
import 'package:fada_alhalij_web/core/resources/style_manager.dart';
import 'package:fada_alhalij_web/core/utils/cashed_data_shared_preferences.dart';
import 'package:fada_alhalij_web/core/widgets/custom_dialog.dart';
import 'package:fada_alhalij_web/core/widgets/custom_elevated_button.dart';
import 'package:fada_alhalij_web/core/widgets/custom_empty.dart';
import 'package:fada_alhalij_web/core/widgets/rial_icon.dart';
import 'package:fada_alhalij_web/features/cart/presentation/widgets/cart_order_item_card.dart';
import 'package:fada_alhalij_web/features/order/data/models/response/get_active_orders_dto.dart';
import 'package:fada_alhalij_web/features/order/presention/cubit/active_orders_cubit/active_orders_cubit.dart';
import 'package:fada_alhalij_web/features/order/presention/widgets/cart_active_order_item_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ActiveOrderView extends StatefulWidget {
  const ActiveOrderView({super.key});

  @override
  State<ActiveOrderView> createState() => _ActiveOrderViewState();
}

class _ActiveOrderViewState extends State<ActiveOrderView> {
  late ActiveOrdersCubit viewModel;

  @override
  void initState() {
    viewModel = getIt.get<ActiveOrdersCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: viewModel..getActiveOrders(),
      child: BlocConsumer<ActiveOrdersCubit, ActiveOrdersState>(
        listener: (context, state) {
          if (state is OrdersActiveFail){
            // CustomDialog.showErrorDialog(context, message: state.exception.toString());
          }

        },
        builder: (context, state) {
          if (state is OrdersActiveSuccess) {
            List<ActiveOrder>? cartItems =
                state.getActiveOrdersEntity.orders ?? [];

            return Column(
              children: [
                Expanded(
                  child: CustomScrollView(
                    slivers: [
                      SliverToBoxAdapter(
                        child: Container(
                          margin: EdgeInsets.only(
                            top: 8,
                            right: 8,
                            left: 8,
                            bottom: 65,),
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
                              Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'تاريخ الطلب',
                                      style: getSemiBoldStyle(
                                        color: ColorManager.indigoDark2,
                                        fontSize: 14,
                                      ),
                                    ),
                                    const TextSpan(
                                      text: ' : ',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),

                                    TextSpan(
                                      text: '${cartItems [0].createdAt?.split(
                                          ' ')[0]}',
                                      style: getSemiBoldStyle(
                                        color: ColorManager.primaryColor,
                                        fontSize: 14,
                                      ), // أو لون مختلف
                                    ),
                                  ],
                                ),
                              ),

                              SizedBox(height: 8),
                              ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(
                                  parent: BouncingScrollPhysics(),
                                ),
                                itemBuilder: (context, index) {
                                  return CartActiveOrderItemCard(
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
          if (state is OrdersActiveFail) {
            if (isActiveUser) {
              return CustomEmpty(
                text: ' لا يوجد طلبات نشطة',
                activeButton: false,
              );

            } else {
              return CustomEmpty(
                text: 'قم بالتسجيل الدخول للمتابعة',
                textButton: 'تسجيل دخول',
                onTap: () {
                  showAuthOrAddToCartDialog(context);
                },);
            }
          }

          return SizedBox();
        },
      ),
    );
  }
}


