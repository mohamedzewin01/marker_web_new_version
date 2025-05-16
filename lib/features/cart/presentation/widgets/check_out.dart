import 'package:fada_alhalij_web/core/di/di.dart';
import 'package:fada_alhalij_web/core/resources/color_manager.dart';
import 'package:fada_alhalij_web/core/resources/style_manager.dart';
import 'package:fada_alhalij_web/core/utils/utilss.dart';
import 'package:fada_alhalij_web/core/widgets/custom_dialog.dart';
import 'package:fada_alhalij_web/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:fada_alhalij_web/features/cart/presentation/widgets/addresses_view.dart';
import 'package:fada_alhalij_web/features/cart/presentation/widgets/cart_order.dart';
import 'package:fada_alhalij_web/features/cart/presentation/widgets/check_out_button.dart';
import 'package:fada_alhalij_web/features/order/presention/cubit/orders_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckOut extends StatefulWidget {
  const CheckOut({super.key});

  @override
  State<CheckOut> createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  late CartCubit viewModel;

  @override
  void initState() {
    viewModel = getIt.get<CartCubit>();
    viewModel.getCart();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key:viewModel.scaffoldKey ,
      body:  BlocProvider.value(
        value: viewModel,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.only(top: 40, right: 2, left: 2),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: ColorManager.primaryColor,
          ),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: ColorManager.white,
            ),
            child: Column(
              children: [
                Expanded(
                  child: CustomScrollView(
                    slivers: [
                      SliverToBoxAdapter(
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: InkWell(
                                onTap: () {
                                  Navigator.pop(context, true);
                                },
                                child: Container(
                                  height: 35,
                                  width: 35,
                                  padding: EdgeInsets.only(right: 7),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(color: ColorManager.primaryColor),
                                    color: Colors.white,
                                  ),
                                  child: Center(
                                    child: Icon(
                                      Icons.arrow_back_ios,
                                      size: 18,
                                      color:ColorManager.primaryColor,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: MediaQuery.sizeOf(context).width * .25,),

                            Text(
                              'تأكيد الطلب',
                              style: getSemiBoldStyle(
                                color: ColorManager.indigoDark2,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SliverToBoxAdapter(child: const SizedBox(height: 8)),
                      CartOrder(),
                      SliverToBoxAdapter(child: const SizedBox(height: 8)),
                      SliverToBoxAdapter(child: AddressesView()),
                      SliverToBoxAdapter(child: const SizedBox(height: 8)),
                      SliverToBoxAdapter(
                        child: CheckOutButton(
                          idAddress: viewModel.idAddress ?? 0,
                        ),
                      ),
                      SliverToBoxAdapter(child: const SizedBox(height: 100)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );



  }
}


