import 'package:fada_alhalij_web/core/functions/launch_url.dart';
import 'package:fada_alhalij_web/core/resources/assets_manager.dart';
import 'package:fada_alhalij_web/core/resources/color_manager.dart';
import 'package:fada_alhalij_web/core/resources/style_manager.dart';
import 'package:fada_alhalij_web/core/utils/cashed_data_shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/functions/create_pdf.dart';
import '../../../app_search/presentation/bloc/search_cubit.dart';

class CustomFloatingAction extends StatelessWidget {
  const CustomFloatingAction({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 25),
      child: FloatingActionButton(
        mini: true,
        backgroundColor: ColorManager.primaryColor,
        child: SvgPicture.asset(Assets.share,
          colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),width: 30,height: 30,),
        onPressed: () async {
          // createPdf(products: SearchCubit.get(context).filteredProducts);
          await showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              Future(() async {
                await CustomLaunchUrl.launchUrlShareWeb(
                  title: CacheService.getData(
                    key: CacheConstants.storeName,
                  ),
                  details: CacheService.getData(
                    key: CacheConstants.storeDescription,
                  ),
                  urlPreview: CacheService.getData(
                    key: CacheConstants.storeUrlImage,
                  ),
                );
                if (context.mounted) {
                  Navigator.of(context).pop();
                }
              });
              return AlertDialog(
                backgroundColor: Colors.transparent,
                title: Text(
                  'جارٍ التحضير...',
                  style: getSemiBoldStyle(color: ColorManager.orange),
                ),
                content: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CircularProgressIndicator(
                        color: ColorManager.orange,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'جارٍ التحضير...',
                        style: getSemiBoldStyle(color: ColorManager.orange),
                      )
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}