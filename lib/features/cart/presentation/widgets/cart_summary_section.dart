import 'package:fada_alhalij_web/core/resources/color_manager.dart';
import 'package:fada_alhalij_web/core/resources/style_manager.dart';
import 'package:fada_alhalij_web/core/widgets/rial_icon.dart';
import 'package:fada_alhalij_web/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:flutter/material.dart';

class CartSummarySection extends StatelessWidget {
  const CartSummarySection({
    super.key,

    required this.viewModel,

  });


  final CartCubit viewModel;


  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(
              vertical: 8.0,
              horizontal: 16,
            ),
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.blue.shade50,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.blue),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.local_offer, color: Colors.blue),
                SizedBox(width: 8),
                Text(
                  'احصل على خصم عند الشراء فوق 100 ريال!',
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(
              top: 16.0,
              right: 16.0,
              left: 16.0,
              bottom: 65,
            ),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        'الخصم:',
                        style: getSemiBoldStyle(color:  ColorManager.lightTextColor,
                          fontSize: 14,)
                    ),
                    Spacer(),
                    Text(
                      viewModel.myCart!.totalDiscount!.toStringAsFixed(2),
                      style:getSemiBoldStyle(color: ColorManager.lightTextColor, fontSize: 16),
                    ),
                    RialIcon(color: ColorManager.darkTextColor,size: 14,)
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Text(
                      'خدمة التوصيل',
                      style: getSemiBoldStyle(color:  ColorManager.lightTextColor,
                        fontSize: 14,),
                    ),
                    Spacer(),
                    Text(
                      '${20}',
                      style:getSemiBoldStyle(color: ColorManager.lightTextColor, fontSize: 16),



                    ),
                    RialIcon(color: ColorManager.darkTextColor,size: 14,)
                  ],
                ),
                SizedBox(height: 8),
                Divider(color: Colors.grey.shade300),
                SizedBox(height: 8),
                Row(
                  children: [
                    Text(
                      'السعر النهائي:',
                      style: getSemiBoldStyle(color: ColorManager.lightTextColor, fontSize: 14),

                    ),
                    Spacer(),
                    Text(
                      viewModel.myCart!.finalPrice!.toStringAsFixed(2),
                      style: TextStyle(
                        color: ColorManager.darkTextColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    RialIcon(),
                  ],
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                /// TODO: Handle button press
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorManager.orange,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 15,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        30.0,
                      ),
                    ),
                    elevation: 2,
                  ),
                  child:  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: Text(
                          'المتابعة لإتمام الشراء',
                          style: getSemiBoldStyle(
                              color: Colors.white,
                              fontSize: 16
                          ),
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
}