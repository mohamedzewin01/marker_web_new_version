import 'package:fada_alhalij_web/core/di/di.dart';
import 'package:fada_alhalij_web/core/functions/is_user_logged_in.dart';
import 'package:fada_alhalij_web/core/resources/cashed_image.dart';
import 'package:fada_alhalij_web/core/resources/color_manager.dart';
import 'package:fada_alhalij_web/core/widgets/custom_elevated_button.dart';
import 'package:fada_alhalij_web/features/cart/data/models/response/cart_dto.dart';
import 'package:fada_alhalij_web/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:fada_alhalij_web/features/cart/presentation/widgets/cart_item_card.dart';
import 'package:fada_alhalij_web/features/cart/presentation/widgets/skeletonizer_cart.dart';
import 'package:fada_alhalij_web/features/cart/presentation/widgets/tab_item.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CartItem {
  final String id;
  final String name;
  final String imageUrl;
  final double price;
  final double? originalPrice;
  final bool isSuggestion;
  int quantity;

  CartItem({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.price,
    this.originalPrice,
    this.isSuggestion = false,
    this.quantity = 1,
  });
}

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  late CartCubit viewModel;

  int _selectedTabIndex = 0; // 0: Cart items, 1: Checkout, 2: Delivery

  @override
  void initState() {
    viewModel = getIt.get<CartCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const Color primaryColor = Color(0xFF00A0A0);
    const Color darkTextColor = Color(0xFF333333);
    const Color lightTextColor = Color(0xFF757575);
    const Color checkoutButtonColor = Color(0xFF80CBC4);

    return BlocProvider(
      create: (context) => viewModel..getCart(),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TabItem(
                      title: "Cart items",
                      index: 0,
                      // Assign index 0
                      isActive: _selectedTabIndex == 0,
                      activeColor: primaryColor,
                      onTap: () {
                        setState(() {
                          _selectedTabIndex = 0;
                          // Add logic here if content should change based on tab
                          print("Cart items tab selected");
                        });
                      },
                    ),
                    TabItem(
                      title: "Checkout",
                      index: 1,

                      // Assign index 1
                      isActive: _selectedTabIndex == 1,
                      activeColor: primaryColor,
                      onTap: () {
                        setState(() {
                          _selectedTabIndex = 1;
                          // Add logic here if content should change based on tab
                          print("Checkout tab selected");
                        });
                      },
                    ),
                    TabItem(
                      title: "Delivery",
                      index: 2,
                      // Assign index 2
                      isActive: _selectedTabIndex == 2,
                      activeColor: primaryColor,
                      onTap: () {
                        setState(() {
                          _selectedTabIndex = 2;
                          // Add logic here if content should change based on tab
                          print("Delivery tab selected");
                        });
                      },
                    ),
                  ],
                ),
              ),
              BlocConsumer<CartCubit, CartState>(
                listener: (context, state) {
                  // TODO: implement listener
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
                    // Cart? myCart = state.cartEntity?.cart;
                    return Expanded(
                      child: Column(
                        children: [
                          Expanded(
                            child: ListView.builder(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16.0,
                              ),
                              itemCount: viewModel.cartItems.length,
                              itemBuilder: (context, index) {
                                return CartItemCard(
                                  viewModel: viewModel,
                                  // item: viewModel.cartItems[index],
                                  index: index,
                                );
                              },
                            ),
                          ),

                          Container(
                            padding: const EdgeInsets.only(
                              top: 16.0,
                              right: 16.0,
                              left: 16.0,
                              bottom: 65,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  spreadRadius: 1,
                                  blurRadius: 5,
                                  offset: const Offset(
                                    0,
                                    -2,
                                  ), // Shadow at the top
                                ),
                              ],
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Total (without tax)',
                                      style: TextStyle(
                                        color: lightTextColor,
                                        fontSize: 14,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      '${viewModel.myCart!.finalPrice!.toStringAsFixed(2)} ريال',
                                      style: TextStyle(
                                        color: darkTextColor,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    // Handle checkout action
                                    print("Checkout button pressed");
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: checkoutButtonColor,
                                    // Use the lighter blue
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 40,
                                      vertical: 15,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30.0),
                                    ),
                                    elevation: 2,
                                  ),
                                  child: const Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        'Checkout',
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.white,
                                        ),
                                      ),
                                      SizedBox(width: 8),
                                      Icon(
                                        Icons.arrow_forward_ios,
                                        size: 16,
                                        color: Colors.white,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                  if (state is CartLoading) {
                    return SkeCart();
                  }
                  if (state is CartFail) {
                    return CustomElevatedButton(
                      buttonColor: ColorManager.orange,
                      title: "تسجيل دخول",
                      onPressed: () {
                        showAuthOrAddToCartDialog(context, );
                      },
                    );
                  }
                  return CircularProgressIndicator(color: ColorManager.orange,);
                },
              ),

              // --- Minimum Order Message ---
            ],
          ),
        ),
      ),
    );
  }

  // --- Helper Widget for Tabs (Modified) ---
  // Widget _buildTabItem({
  //   required String title,
  //   required int index, // Added index parameter
  //   required bool isActive,
  //   required Color activeColor,
  //   required VoidCallback onTap, // Added onTap callback
  // }) {
  //   return InkWell(
  //     // Make the tab tappable
  //     onTap: onTap,
  //     // Call the provided onTap function
  //     borderRadius: BorderRadius.circular(4),
  //     // Optional: Add ripple effect constraints
  //     child: Padding(
  //       // Add padding for better tap area and spacing
  //       padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
  //       child: Column(
  //         mainAxisSize: MainAxisSize.min,
  //         children: [
  //           Text(
  //             title,
  //             style: TextStyle(
  //               color: isActive ? activeColor : Colors.grey[400],
  //               fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
  //               fontSize: 14,
  //             ),
  //           ),
  //           const SizedBox(height: 4),
  //           // Show underline only if the tab is active
  //           if (isActive)
  //             Container(
  //               height: 3,
  //               width: 60, // Adjust width as needed
  //               decoration: BoxDecoration(
  //                 color: activeColor,
  //                 borderRadius: BorderRadius.circular(
  //                   1.5,
  //                 ), // Optional: Rounded corners for the line
  //               ),
  //             ),
  //           // Add placeholder for inactive tabs to maintain height consistency
  //           if (!isActive) const SizedBox(height: 3),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  // --- Helper Widget for Cart Item Card (Now accepts color params) ---
  // Widget _buildCartItemCard({
  //   required CartItems item,
  //   required int index,
  //
  // }) {
  //   return Padding(
  //     padding: const EdgeInsets.symmetric(vertical: 8.0),
  //     child: Row(
  //       crossAxisAlignment: CrossAxisAlignment.center,
  //       children: [
  //         Stack(
  //           children: [
  //             Container(
  //               padding: const EdgeInsets.all(6),
  //               decoration: BoxDecoration(
  //                 color: const Color(0xFFF0F4F8),
  //                 borderRadius: BorderRadius.circular(10),
  //                 border: Border.all(color: Colors.grey[200]!, width: 1),
  //               ),
  //               child: CustomImage(
  //                 url: item.product?.imgCover ?? '',
  //                 width: 50,
  //                 height: 50,
  //
  //               ),
  //             ),
  //             // if (item.isSuggestion)
  //             //   Positioned(
  //             //     bottom: 0,
  //             //     left: 0,
  //             //     right: 0,
  //             //     child: Container(
  //             //       padding: const EdgeInsets.symmetric(
  //             //         vertical: 2,
  //             //         horizontal: 4,
  //             //       ),
  //             //       decoration: BoxDecoration(
  //             //         color: primaryColor.withOpacity(0.8),
  //             //         borderRadius: const BorderRadius.only(
  //             //           bottomLeft: Radius.circular(10),
  //             //           bottomRight: Radius.circular(10),
  //             //         ),
  //             //       ),
  //             //       child: const Text(
  //             //         'Suggestion',
  //             //         textAlign: TextAlign.center,
  //             //         style: TextStyle(color: Colors.white, fontSize: 8),
  //             //       ),
  //             //     ),
  //             //   ),
  //           ],
  //         ),
  //         const SizedBox(width: 8),
  //
  //         // Product Details
  //         Expanded(
  //           child: Column(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             mainAxisAlignment: MainAxisAlignment.center,
  //             children: [
  //               Text(
  //                 item.product?.title??'',
  //                 style: TextStyle(
  //                   fontSize: 14,
  //                   fontWeight: FontWeight.w500,
  //                   color: ColorManager.black,
  //                 ),
  //                 maxLines: 2,
  //                 overflow: TextOverflow.ellipsis,
  //               ),
  //               const SizedBox(height: 6),
  //               Row(
  //                 children: [
  //                   Text(
  //                     '${item.product?.priceAfterDiscount?.toStringAsFixed(2)}ريال',
  //                     style: TextStyle(
  //                       fontSize: 14,
  //                       fontWeight: FontWeight.bold,
  //                       color: ColorManager.black,
  //                     ),
  //                   ),
  //                   if (item.product?.price != null) ...[
  //                     const SizedBox(width: 8),
  //                     Text(
  //                       '${item.product?.price!.toStringAsFixed(0)}da',
  //                       style: TextStyle(
  //                         fontSize: 12,
  //                         color: ColorManager.cyanDark,
  //                         decoration: TextDecoration.lineThrough,
  //                       ),
  //                     ),
  //                   ],
  //                 ],
  //               ),
  //             ],
  //           ),
  //         ),
  //         const SizedBox(width: 10),
  //
  //         // Quantity Selector
  //         Container(
  //           decoration: BoxDecoration(
  //             color: ColorManager.primaryColor,
  //             borderRadius: BorderRadius.circular(20),
  //           ),
  //           child: Row(
  //             mainAxisSize: MainAxisSize.min,
  //             children: [
  //               InkWell(
  //                 // onTap: () => _decreaseQuantity(index),
  //                 borderRadius: const BorderRadius.only(
  //                   topLeft: Radius.circular(20),
  //                   bottomLeft: Radius.circular(20),
  //                 ),
  //                 child: const Padding(
  //                   padding: EdgeInsets.symmetric(
  //                     horizontal: 10.0,
  //                     vertical: 6.0,
  //                   ),
  //                   child: Icon(Icons.remove, size: 18, color: Colors.white),
  //                 ),
  //               ),
  //               Container(
  //                 color: Colors.white.withOpacity(0.5),
  //                 width: 1,
  //                 height: 20,
  //               ),
  //               Padding(
  //                 padding: const EdgeInsets.symmetric(
  //                   horizontal: 8.0,
  //                   vertical: 6.0,
  //                 ),
  //                 child: Text(
  //                   '${item.quantity}',
  //                   style: const TextStyle(
  //                     fontSize: 12,
  //                     fontWeight: FontWeight.bold,
  //                     color: Colors.white,
  //                   ),
  //                 ),
  //               ),
  //               Container(
  //                 color: Colors.white.withOpacity(0.5),
  //                 width: 1,
  //                 height: 20,
  //               ),
  //               InkWell(
  //                 // onTap: () => _increaseQuantity(index),
  //                 borderRadius: const BorderRadius.only(
  //                   topRight: Radius.circular(20),
  //                   bottomRight: Radius.circular(20),
  //                 ),
  //                 child: const Padding(
  //                   padding: EdgeInsets.symmetric(
  //                     horizontal: 10.0,
  //                     vertical: 6.0,
  //                   ),
  //                   child: Icon(Icons.add, size: 18, color: Colors.white),
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }
} // End of _CartViewState
