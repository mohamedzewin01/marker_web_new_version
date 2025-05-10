import 'package:fada_alhalij_web/core/di/di.dart';
import 'package:fada_alhalij_web/core/functions/is_user_logged_in.dart';
import 'package:fada_alhalij_web/core/resources/assets_manager.dart';
import 'package:fada_alhalij_web/core/resources/color_manager.dart';
import 'package:fada_alhalij_web/core/resources/style_manager.dart';
import 'package:fada_alhalij_web/core/widgets/custom_elevated_button.dart';
import 'package:fada_alhalij_web/core/widgets/rial_icon.dart';
import 'package:fada_alhalij_web/features/cart/data/models/response/cart_dto.dart';
import 'package:fada_alhalij_web/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:fada_alhalij_web/features/cart/presentation/widgets/cart_item_card.dart';
import 'package:fada_alhalij_web/features/cart/presentation/widgets/cart_items_list_section.dart';
import 'package:fada_alhalij_web/features/cart/presentation/widgets/cart_summary_section.dart';
import 'package:fada_alhalij_web/features/cart/presentation/widgets/skeletonizer_cart.dart';
import 'package:fada_alhalij_web/features/cart/presentation/widgets/tab_item.dart';
import 'package:fada_alhalij_web/features/layout/presentation/cubit/layout_cubit.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/utils/cashed_data_shared_preferences.dart';

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

class _CartViewState extends State<CartView>
    with SingleTickerProviderStateMixin {
  late CartCubit viewModel;

  @override
  void initState() {
    viewModel = getIt.get<CartCubit>();
    viewModel.tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    viewModel.tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel..getCart(),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: ColorManager.orange,
            // تغيير اللون هنا
            title: Text(
              "السلة",
              style: getSemiBoldStyle(
                color: ColorManager.white, // تخصيص لون النص
                fontSize: 14,
              ),
            ),
            actions: [
              Transform.rotate(
                angle: 329 * 3.14159 / 180,
                child: Padding(
                  padding: const EdgeInsets.only(left: 0,top: 24),
                  child: SvgPicture.asset(Assets.cart, colorFilter: const ColorFilter.mode(
                      Colors.white, BlendMode.srcIn) ,),
                ),
              ),

            ],
            leading: Padding(
              padding: const EdgeInsets.all(4.0),
              child: InkWell(
                onTap: () {
                  LayoutCubit.get(context).changeIndex(0);
                },
                child: Container(
                  height: 45,
                  width: 45,
                  padding: EdgeInsets.only(right: 7),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.grey.shade200),
                    color: Colors.white,
                  ),
                  child: Center(
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: 22,
                      color: Colors.grey.shade700,
                    ),
                  ),
                ),
              ),
            ),
            centerTitle: true,
            bottom: PreferredSize(

              preferredSize: const Size.fromHeight(35),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                  color: ColorManager.white,
                ),
                child: DefaultTabController(
                  length: 3, // Number of tabs
                  child: TabBar(

                    controller: viewModel.tabController,
                    labelStyle: getSemiBoldStyle(color: ColorManager.orange),
                    tabs: [
                      Tab(text: "السلة",),
                      Tab(text: "الطلبات النشطة"),
                      Tab(text: "الطلبات السابقة"),
                    ],
                  ),
                ),
              ),
            ),
          ),
          body: DefaultTabController(
            length: 3, // Number of tabs
            child: TabBarView(
              controller: viewModel.tabController,
              children: [
                Column(
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
                ),
                Text("Active Products Tab"), // Tab for Active Products
                Text("Inactive Products Tab"), // Tab for Inactive Products
              ],
            ),
          ),
        ),
      ),
    );
  }
}

