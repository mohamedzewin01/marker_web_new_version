import 'package:fada_alhalij_web/core/resources/cashed_image.dart';
import 'package:fada_alhalij_web/core/resources/color_manager.dart';
import 'package:fada_alhalij_web/features/cart/data/models/response/cart_dto.dart';
import 'package:fada_alhalij_web/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartItemCard extends StatefulWidget {
  const CartItemCard({
    super.key,
    // required this.item,
    required this.index,
    required this.viewModel,
  });

  final CartCubit viewModel;

  // final CartItems item;
  final int index;

  @override
  State<CartItemCard> createState() => _CartItemCardState();
}

class _CartItemCardState extends State<CartItemCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: const Color(0xFFF0F4F8),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey[200]!, width: 1),
                ),
                child: CustomImage(
                  url:
                      widget
                          .viewModel
                          .cartItems[widget.index]
                          .product
                          ?.imgCover ??
                      '',
                  width: 50,
                  height: 50,
                ),
              ),
            ],
          ),
          const SizedBox(width: 8),

          // Product Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.viewModel.cartItems[widget.index].product?.title ?? '',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: ColorManager.black,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    Text(
                      '${widget.viewModel.cartItems[widget.index].product?.priceAfterDiscount?.toStringAsFixed(2)}ريال',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: ColorManager.black,
                      ),
                    ),
                    if (widget
                            .viewModel
                            .cartItems[widget.index]
                            .product
                            ?.price !=
                        null) ...[
                      const SizedBox(width: 8),
                      Text(
                        '${widget.viewModel.cartItems[widget.index].product?.price!.toStringAsFixed(0)}da',
                        style: TextStyle(
                          fontSize: 12,
                          color: ColorManager.cyanDark,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    ],
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),

          // Quantity Selector
          Container(
            decoration: BoxDecoration(
              color: ColorManager.primaryColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                InkWell(
                  onTap: () async {
                    await widget.viewModel.decreaseQuantity(
                      productId:
                          widget.viewModel.cartItems[widget.index].product!.id!,
                      index: widget.index,
                    );

                    setState(() {});
                  },
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.0,
                      vertical: 6.0,
                    ),
                    child: Icon(Icons.remove, size: 18, color: Colors.white),
                  ),
                ),
                Container(
                  color: Colors.white.withOpacity(0.5),
                  width: 1,
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8.0,
                    vertical: 6.0,
                  ),
                  child: Text(
                    '${widget.viewModel.cartItems[widget.index].quantity}',
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  color: Colors.white.withOpacity(0.5),
                  width: 1,
                  height: 20,
                ),
                InkWell(
                  onTap: () async {
                    await widget.viewModel.increaseQuantity(
                      productId:
                      widget.viewModel.cartItems[widget.index].product!.id!,
                      index: widget.index,
                    );
                    setState(() {

                    });
                  },
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.0,
                      vertical: 6.0,
                    ),
                    child: Icon(Icons.add, size: 18, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
