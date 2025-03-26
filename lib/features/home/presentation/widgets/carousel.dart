import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:fada_alhalij_web/core/api/api_constants.dart';
import 'package:fada_alhalij_web/core/resources/color_manager.dart';
import 'package:fada_alhalij_web/core/resources/style_manager.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../data/models/response/home_model_response_dto.dart';

class Carousel extends StatelessWidget {
  const Carousel({super.key, required this.banners});

  final List<Banners> banners;

  @override
  Widget build(BuildContext context) {
    // قائمة الألوان
    final List<Color> colors = [
      Colors.orange,
      Colors.red,
      Colors.blue,
      Colors.green,
      Colors.purple,

    ];

    // مولد عشوائي
    final Random random = Random();

    // بناء العناصر
    final List<Widget> imageSliders = banners
        .map(
          (items) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(16)),
          child: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width - 48,
                decoration: BoxDecoration(
                  // اختيار لون عشوائي من القائمة
                  color: colors[random.nextInt(colors.length)],
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(18),
                            bottomLeft: Radius.circular(18),
                          ),
                          color: Colors.green,
                          image: DecorationImage(
                            image: NetworkImage(
                              '${ApiConstants.baseUrlImage}${items.bannersUrlImage}',
                            ),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            items.bannersTitle ?? '',
                            maxLines: 1,
                            textDirection: TextDirection.rtl,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontFamily: GoogleFonts.cairo(
                                fontWeight: FontWeight.w900,
                              ).fontFamily,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            items.bannersDescription ?? '',
                            maxLines: 1,
                            textDirection: TextDirection.rtl,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                              fontFamily: GoogleFonts.cairo(
                                fontWeight: FontWeight.w900,
                              ).fontFamily,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    )
        .toList();

    return RepaintBoundary(
      child: CarouselSlider(
        options: CarouselOptions(
          viewportFraction: 0.9,
          aspectRatio: 4.5,
          enableInfiniteScroll: true,
          autoPlay: false,
          autoPlayInterval: const Duration(seconds: 5),
        ),
        items: imageSliders,
      ),
    );
  }
}
