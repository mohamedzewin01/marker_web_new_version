import 'package:fada_alhalij_web/core/di/di.dart';
import 'package:fada_alhalij_web/core/resources/color_manager.dart';
import 'package:fada_alhalij_web/core/resources/style_manager.dart';
import 'package:fada_alhalij_web/core/utils/utilss.dart';
import 'package:fada_alhalij_web/core/widgets/custom_dialog.dart';
import 'package:fada_alhalij_web/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:fada_alhalij_web/features/cart/presentation/widgets/addresses_view.dart';
import 'package:fada_alhalij_web/features/cart/presentation/widgets/cart_order.dart';
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
    return PopScope(
      canPop: true,
      onPopInvokedWithResult: (didPop, result) {},
      child: BlocProvider.value(
        value: viewModel,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.only(top: 8, right: 2, left: 2),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: ColorManager.orange,
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
                        child: Text(
                          ' لاتمام الشراء',
                          style: getSemiBoldStyle(
                            color: ColorManager.indigoDark2,
                            fontSize: 16,
                          ),
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

class CheckOutButton extends StatefulWidget {
  const CheckOutButton({super.key, required this.idAddress});

  final int idAddress;

  @override
  State<CheckOutButton> createState() => _CheckOutButtonState();
}

class _CheckOutButtonState extends State<CheckOutButton> {
  late OrdersCubit viewModel;

  @override
  void initState() {
    viewModel = getIt.get<OrdersCubit>();
    super.initState();
  }

  @override
  void dispose() {
    viewModel.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: viewModel,
      child: BlocListener<OrdersCubit, OrdersState>(
        listener: (context, state) {
          if (state is AddOrdersSuccess) {

            Navigator.pop(context);
            CustomDialog.showSuccessDialog(context,message: 'تم اضافة الطلب بنجاح');
          }
          if(state is AddOrdersFail){
            Navigator.pop(context);
            Navigator.pop(context);
            String message = extractErrorMessage(state.exception);
            CustomDialog.showErrorDialog(context, message: message);
          }
          if(state is AddOrdersLoading){

            CustomDialog.showLoadingDialog(context);
          }
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: ColorManager.orange,
            ),

            onPressed: () async {
              print(widget.idAddress);
              if (widget.idAddress == 0) return;
              await viewModel.addOrder(idAddress: widget.idAddress);
              if (context.mounted) {
                await context.read<CartCubit>().getCart();
              }
            },
            child: Text(
              'تأكيد الشراء',
              style: getSemiBoldStyle(color: ColorManager.white, fontSize: 16),
            ),
          ),
        ),
      ),
    );
  }
}
