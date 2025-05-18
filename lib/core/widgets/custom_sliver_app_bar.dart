import 'package:auto_size_text/auto_size_text.dart';
import 'package:fada_alhalij_web/core/functions/launch_url.dart';
import 'package:fada_alhalij_web/core/resources/assets_manager.dart';
import 'package:fada_alhalij_web/core/resources/color_manager.dart';
import 'package:fada_alhalij_web/core/resources/curve_clipper.dart';
import 'package:fada_alhalij_web/core/resources/style_manager.dart';
import 'package:fada_alhalij_web/core/utils/cashed_data_shared_preferences.dart';
import 'package:fada_alhalij_web/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// class CustomSliverAppBar extends StatelessWidget {
//   const CustomSliverAppBar({
//     super.key,
//     required this.title,
//     this.leading,
//     this.actions, this.onPressed,
//   });
//
//   final String title;
//   final Widget? leading;
//   final List<Widget>? actions;
//   final void Function()? onPressed;
//
//   @override
//   Widget build(BuildContext context) {
//     return SliverAppBar(
//       backgroundColor: ColorManager.primaryColor,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.vertical(bottom: Radius.circular(4)),
//       ),
//       title: AutoSizeText(
//         title ?? '',
//         maxLines: 1,
//         overflow: TextOverflow.ellipsis,
//         style: getSemiBoldStyle(color: ColorManager.white, fontSize: 16),
//       ),
//       centerTitle: true,
//       floating: true,
//       snap: true,
//       automaticallyImplyLeading: false,
//       flexibleSpace: ClipPath(
//         clipper: InwardCurveClipper(),
//         child: Container(color: ColorManager.secondaryColor),
//       ),
//       leading:
//       leading ??
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 16),
//             child: Container(
//               padding: EdgeInsets.all(1),
//               decoration: BoxDecoration(
//                 shape: BoxShape.circle,
//                 color: ColorManager.placeHolderColor,
//               ),
//               child: CircleAvatar(
//                 backgroundColor: ColorManager.white,
//                 child: Image.asset(Assets.logo, scale: 1, fit: BoxFit.fill),
//               ),
//             ),
//           ),
//
//       actions:
//       actions ??
//           [
//             IconButton(
//               onPressed: onPressed,
//               icon: Icon(
//                 Icons.arrow_forward_ios,
//                 size: 22,
//                 color: Colors.white,
//               ),
//             ),
//           ],
//     );
//   }
// }



class CustomSliverAppBar extends StatelessWidget {
  final String title;
  final VoidCallback? onBackTap;
  final bool showLogo;
  final bool pinned;

  const CustomSliverAppBar({
    super.key,
    required this.title,
    this.onBackTap,
    this.showLogo = true,
    this.pinned = true,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: pinned,
      expandedHeight: 70,
      backgroundColor: ColorManager.primaryColor,
      centerTitle: true,

      title: AutoSizeText(
        title ??
            '',
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: getSemiBoldStyle(color: ColorManager.white, fontSize: 16),
      ),
      leading: GestureDetector(
        onTap: () async {
          await showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              Future(() async {
                await CustomLaunchUrl.launchUrlShareWeb(
                  title: CacheService.getData(key: CacheConstants.storeName),
                  details: CacheService.getData(
                    key: CacheConstants.storeDescription,
                  ),
                  urlPreview: CacheService.getData(
                    key: CacheConstants.storeUrlImage,
                  ),
                  phone: CacheService.getData(key: CacheConstants.storePhone),
                );
                if (context.mounted) {
                  Navigator.of(context).pop();
                }
              });
              return AlertDialog(
                backgroundColor: Colors.transparent,
                content: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CircularProgressIndicator(color: ColorManager.primaryColor),
                      const SizedBox(height: 16),
                      Text(
                        'جارٍ التحضير...',
                        style: getSemiBoldStyle(color: ColorManager.primaryColor,fontSize: 16),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SvgPicture.asset(
            Assets.share,
            colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
            width: 25,
            height: 25,
          ),
        ),
      ),
      actions: showLogo
          ? [
        Padding(
          padding: const EdgeInsets.only(left: 12.0, right: 8.0),
          child: Image.asset(Assets.logo3, scale: 1),
        )
      ]
          : [],
      floating: true,
      snap: true,
      automaticallyImplyLeading: false,

      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(24),
        child: Container(
          height: 22,
          decoration: BoxDecoration(
            color: ColorManager.white,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
        ),
      ),
    );
  }
}


class CustomSliverSearchAppBar extends StatelessWidget {
  final String title;
  final VoidCallback? onBackTap;
  final bool showLogo;
  final bool pinned;

  const CustomSliverSearchAppBar({
    super.key,
    required this.title,
    this.onBackTap,
    this.showLogo = true,
    this.pinned = true,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: pinned,
      expandedHeight: 70,
      backgroundColor: ColorManager.primaryColor,
      centerTitle: true,

      title: AutoSizeText(
        title ??
            '',
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: getSemiBoldStyle(color: ColorManager.white, fontSize: 16),
      ),
      leading: GestureDetector(
        onTap: () async {

        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Image.asset(
            Assets.search,
            color:Colors.white ,
            width: 25,
            height: 25,
          ),
        ),
      ),
      actions: showLogo
          ? [
        Padding(
          padding: const EdgeInsets.only(left: 12.0, right: 8.0),
          child: Image.asset(Assets.logo3, scale: 1),
        )
      ]
          : [],
      floating: true,
      snap: true,
      automaticallyImplyLeading: false,

      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(24),
        child: Container(
          height: 22,
          decoration: BoxDecoration(
            color: ColorManager.white,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
        ),
      ),
    );
  }
}