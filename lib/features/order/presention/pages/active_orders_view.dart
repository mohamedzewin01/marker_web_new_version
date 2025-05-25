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
import 'package:fada_alhalij_web/features/order/presention/widgets/order_details.dart';
import 'package:fada_alhalij_web/features/order/presention/widgets/order_summary_card.dart';
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
          if (state is OrdersActiveFail) {
            // CustomDialog.showErrorDialog(context, message: state.exception.toString());
          }
        },
        builder: (context, state) {
          if (state is OrdersActiveSuccess) {
            List<ActiveOrder>? order = state.getActiveOrdersEntity.orders ?? [];

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
                            bottom: 16,
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
                              ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(
                                  parent: BouncingScrollPhysics(),
                                ),
                                itemBuilder: (context, index) {
                                  return Column(
                                    children: [
                                      // CartActiveOrderItemCard(
                                      //   index: index,
                                      //   cartItem: order[index],
                                      // ),
                                      InkWell(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder:
                                                  (context) => OrderDetails(
                                                    order: order[index],
                                                  ),
                                            ),
                                          );
                                        },
                                        child: OrderSummaryCard(
                                          orderNumber:
                                              order[index].orderNumber ?? '',
                                          orderDate:
                                              order[index].createdAt ?? '',
                                          itemsCount:
                                              order[index].orderItems?.length ??
                                              0,
                                          totalAmount:
                                              order[index].totalPrice ?? 0,
                                        ),
                                      ),
                                    ],
                                  );
                                },
                                itemCount: order.length,
                              ),
                            ],
                          ),
                        ),
                      ),

                      TrackOrder(),
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
                },
              );
            }
          }

          return SizedBox();
        },
      ),
    );
  }
}

class TrackOrder extends StatelessWidget {
  // Define colors used in the design
  final Color primaryGreen = Color(
    0xFFC8FFB9,
  ); // Light green background for active icons
  final Color secondaryGreen = Color(0xFF6AC92A); // Green icon color
  final Color activeLineColor = Color(
    0xFFD3D3D3,
  ); // Grey line color for active stages
  final Color inactiveColor =
      Colors.grey[400]!; // Grey color for inactive icons and text
  final Color lightGreyBackground = Color(
    0xFFF2F2F2,
  ); // Background color of the body
  final Color darkTextColor = Colors.black87; // Dark text color
  final Color lightTextColor = Colors.grey[600]!;

  TrackOrder({super.key}); // Light grey text color

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(
          bottom: kBottomNavigationBarHeight + 100,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              _buildTimeline(),
            ],
          ),
        ),
      ),
    );
  }



  Widget _buildTimeline() {
    return IntrinsicHeight(
      // Use IntrinsicHeight to make the Column take the height of its children
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        // Stretch children vertically
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // Space out the timeline items vertically
              children: [
                _buildTimelineText(
                  'Order Placed',
                  'October 21 2021',
                  isActive: true,
                ),
                _buildTimelineText(
                  'Order Confirmed',
                  'October 21 2021',
                  isActive: true,
                ),
                _buildTimelineText(
                  'Order Shipped',
                  'October 21 2021',
                  isActive: true,
                ),
                _buildTimelineText(
                  'Out for Delivery',
                  'Pending',
                  isActive: false,
                ),
                _buildTimelineText(
                  'Order Delivered',
                  'Pending',
                  isActive: false,
                ),
              ],
            ),
          ),
          SizedBox(width: 16),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Top spacing (aligns first icon with top of text)
              SizedBox(height: 10),
              // Adjust this based on title text height
              _buildTimelineIcon(isActive: true, icon: Icons.archive_outlined),
              _buildTimelineConnector(isActive: true),
              _buildTimelineIcon(
                isActive: true,
                icon: Icons.check_circle_outline,
              ),
              _buildTimelineConnector(isActive: true),
              _buildTimelineIcon(
                isActive: true,
                icon: Icons.location_on_outlined,
              ),
              _buildTimelineConnector(isActive: false),
              _buildTimelineIcon(
                isActive: false,
                icon: Icons.local_shipping_outlined,
              ),
              _buildTimelineConnector(isActive: false, isLast: true),
              // isLast true for the last connector
              _buildTimelineIcon(
                isActive: false,
                icon: Icons.shopping_cart_outlined,
              ),
              // Bottom spacing (aligns last icon with bottom of text)
              SizedBox(height: 10),
              // Adjust this based on subtitle text height
            ],
          ),

          // Right side: Timeline text details

        ],
      ),
    );
  }

  Widget _buildTimelineIcon({required bool isActive, required IconData icon}) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: isActive ? primaryGreen : Colors.grey[200],
        shape: BoxShape.circle,
        border: isActive ? null : Border.all(color: inactiveColor, width: 1.5),
      ),
      child: Icon(
        icon,
        color: isActive ? secondaryGreen : inactiveColor,
        size: 20,
      ),
    );
  }

  Widget _buildTimelineConnector({
    required bool isActive,
    bool isLast = false,
  }) {
    if (isLast) {
      return Container(); // Don't draw a line after the last item
    }
    return Expanded(
      child: Container(
        width: 2, // Thickness of the line
        color: isActive ? activeLineColor : inactiveColor,
      ),
    );
  }

  Widget _buildTimelineText(
    String title,
    String subtitle, {
    required bool isActive,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      // Add vertical padding to space out the text
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: isActive ? darkTextColor : inactiveColor,
            ),
          ),
          SizedBox(height: 4),
          Text(
            subtitle,
            style: TextStyle(
              fontSize: 14,
              color: isActive ? lightTextColor : inactiveColor,
            ),
          ),
        ],
      ),
    );
  }
}


