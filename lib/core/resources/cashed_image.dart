import 'package:cached_network_image/cached_network_image.dart';
import 'package:fada_alhalij_web/core/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../api/api_constants.dart';

String getFileExtensionFromUrl(String url) {
  List<String> parts = url.split('.');
  String lastPart = parts.last;
  List<String> extensionParts = lastPart.split('?');
  String extension = extensionParts.first;
  return extension;
}

class CustomImage extends StatelessWidget {
  const CustomImage({
    super.key,
    required this.url,
    this.height,
    this.width,
    this.sizeIndicator,
    this.boxFit,
  });

  final String url;
  final double? height;
  final double? width;
  final double? sizeIndicator;
  final BoxFit? boxFit;

  @override
  Widget build(BuildContext context) {
    // log('${ApiConstants.baseUrlImage}$url');
    return getFileExtensionFromUrl(url) == 'svg'
        ? SvgPicture.network(
          Uri.encodeFull(
            url.isNotEmpty ? '${ApiConstants.baseUrlImage}$url' : '',
          ),

          fit: BoxFit.fill,
          placeholderBuilder:
              (context) => Center(
                child: SizedBox(
                  width: sizeIndicator ?? 20,
                  height: sizeIndicator ?? 20,

                  child: const CircularProgressIndicator(
                    color: ColorManager.orange,
                  ),
                ),
              ),
        )
        : CachedNetworkImage(
          height: height,
          width: width ?? MediaQuery.sizeOf(context).width,
          imageUrl: Uri.encodeFull(
            url.isNotEmpty ? '${ApiConstants.baseUrlImage}$url' : '',
          ),
          fit: boxFit ?? BoxFit.fill,
          placeholder:
              (context, url) => Center(
                child: SizedBox(
                  width: sizeIndicator ?? 20,
                  height: sizeIndicator ?? 20,

                  child: CircularProgressIndicator(color: ColorManager.orange),
                ),
              ),
          errorWidget:
              (context, url, error) => const Center(child: Icon(Icons.error)),
        );
  }
}
