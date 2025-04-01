import 'package:fada_alhalij_web/features/layout/presentation/cubit/layout_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fada_alhalij_web/core/resources/color_manager.dart';

import '../../../../core/widgets/custom_text_form_field.dart';
import '../../../../l10n/app_localizations.dart';

class SearchTextFiled extends StatelessWidget {
  const SearchTextFiled({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: CustomTextFormField(
        onTap: () => LayoutCubit.get(context).changeIndex(2),
        controller: TextEditingController(),
        hintText: AppLocalizations.of(context)?.whatAreSearch,
        enabled: true,
        onChanged: (value) {
          // updateSearch(value);
        },
        suffix: Icon(Icons.search, color: ColorManager.placeHolderColor2),
      ),
    );
  }
}
