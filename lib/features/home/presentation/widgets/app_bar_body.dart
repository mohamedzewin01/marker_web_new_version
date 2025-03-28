import 'package:auto_size_text/auto_size_text.dart';
import 'package:fada_alhalij_web/core/resources/curve_clipper.dart';
import 'package:fada_alhalij_web/core/resources/style_manager.dart';
import 'package:fada_alhalij_web/features/home/data/models/response/home_model_response_dto.dart';
import 'package:fada_alhalij_web/localization/locale_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/color_manager.dart';

class AppBarBody extends StatelessWidget {
  const AppBarBody({super.key, this.store});

  final Store? store;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: ColorManager.indigoDark2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(4),
        ),
      ),
      title: AutoSizeText(
        '${store?.storeName} ${PromotionalMessages.goldenOpportunityDontMiss}' ?? '',
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: getSemiBoldStyle(color: ColorManager.white, fontSize: 18),
      ),
      centerTitle: true,
      floating: true,
      snap: true,
      automaticallyImplyLeading: false,
      flexibleSpace: ClipPath(
        clipper: InwardCurveClipper(),
        child: Container(
          color: ColorManager.indigoDark,
        ),
      ),
      leading: StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          String lang = context.read<LocaleCubit>().state.languageCode;
          String title = lang == 'ar' ? 'EN' : 'AR';
          String lang2 = lang == 'ar' ? 'en' : 'ar';

          return GestureDetector(
            onTap: () {
              context.read<LocaleCubit>().changeLanguage(lang2);
              setState(() {});
            },
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Center(
                child: Text(
                  title,
                  style: getSemiBoldStyle(
                    color: ColorManager.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          );
        },
      ),

      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Container(
            padding: EdgeInsets.all(1),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: ColorManager.placeHolderColor,
            ),
            child: CircleAvatar(
              backgroundColor: ColorManager.white,
              child: Image.asset(Assets.logo, scale: 1, fit: BoxFit.fill),
            ),
          ),
        ),
      ],
    );
  }
}



