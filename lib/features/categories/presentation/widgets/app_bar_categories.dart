import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../../../layout/presentation/cubit/layout_cubit.dart';

class AppBarCategories extends StatelessWidget {
  const AppBarCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: ColorManager.placeHolderColor,
            radius: 22.1,
            child: InkWell(
                customBorder:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                onTap: () {
                  LayoutCubit.get(context).changeIndex(0);
                },
                child: SvgPicture.asset(Assets.imagesBack)),
          ),
          SizedBox(
            width: 14,
          ),
          Expanded(
            child: CustomTextFormField(
              controller: TextEditingController(),
              hintText: 'Search products....',
              prefixIcon: Padding(
                padding: EdgeInsets.all(16),
                child: SvgPicture.asset(
                  Assets.imagesSearch,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
