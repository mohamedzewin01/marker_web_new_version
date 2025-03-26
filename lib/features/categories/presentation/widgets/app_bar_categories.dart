import 'package:fada_alhalij_web/core/resources/style_manager.dart';
import 'package:fada_alhalij_web/l10n/app_localizations.dart';
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
          Column(
            children: [
              Image.asset(Assets.logo,height: 40,width: 40,),
              Text(
                'فضاء الخليج',
                style: getSemiBoldStyle(color: ColorManager.primaryColor,fontSize: 10),
              )
            ],
          ),
          SizedBox(
            width: 14,
          ),
          Expanded(
            child: CustomTextFormField(
              controller: TextEditingController(),
              hintText: AppLocalizations.of(context)?.whatAreSearch,
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
