import 'package:fada_alhalij_web/core/resources/color_manager.dart';
import 'package:fada_alhalij_web/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:fada_alhalij_web/features/cart/presentation/widgets/cart_item_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class CartItemsListSection extends StatefulWidget {
  const CartItemsListSection({super.key, required this.viewModel});

  final CartCubit viewModel;

  @override
  State<CartItemsListSection> createState() => _CartItemsListSectionState();
}

class _CartItemsListSectionState extends State<CartItemsListSection> {
  @override
  Widget build(BuildContext context) {
    return SliverList(

      delegate: SliverChildBuilderDelegate((context, index) {
        return Slidable(

          endActionPane: ActionPane(
            extentRatio: 0.15,
            motion: const ScrollMotion(),
            children: [
              SlidableAction(
                onPressed: (context) async {
                  await widget.viewModel.removeItemFromCart(
                    productId: widget.viewModel.cartItems[index].product?.id ?? 0,
                    index: index,
                  );
                  // setState(() {
                  //
                  // });
                },
                backgroundColor: ColorManager.white,
                foregroundColor:  ColorManager.error,
                icon: Icons.delete,

              ),
            ],
          ),
          child: CartItemCard(viewModel: widget.viewModel, index: index),
        );
      }, childCount: widget.viewModel.cartItems.length),
    );
  }
}
