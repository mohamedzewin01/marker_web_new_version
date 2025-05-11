import 'package:fada_alhalij_web/core/resources/color_manager.dart';
import 'package:fada_alhalij_web/core/resources/style_manager.dart';
import 'package:fada_alhalij_web/features/cart/presentation/widgets/addresses_view.dart';
import 'package:flutter/material.dart';

class CheckOut extends StatelessWidget {
  const CheckOut({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(top: 8, right: 2, left: 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: ColorManager.orange,
      ),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: ColorManager.white,
        ),

        child: Column(
          children: [
            Text(
              ' لاتمام الشراء',
              style: getSemiBoldStyle(
                color: ColorManager.darkTextColor,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 8),
            AddressesView(),
          ],
        ),
      ),
    );
  }
}