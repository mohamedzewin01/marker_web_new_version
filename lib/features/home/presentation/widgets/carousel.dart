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

    final List<Color> colors = [
      Colors.orange,
      Colors.red,
      Colors.blue,
      Colors.green,
      Colors.purple,
      Colors.teal,
      Colors.pink,
      Colors.cyan,
      Colors.indigo,
      Colors.lime,
      Colors.deepOrange,
      Colors.deepPurple,
      Colors.lightGreen,
      Colors.lightBlue,
      Colors.brown,
      Colors.grey,
    ];

    final List<String> actionString = [
      '💥', // انفجار - يعبر عن الحماس
      '🎉', // احتفال - يعبر عن السعادة
      '🎁', // هدية - يعبر عن المكافآت
      '💯', // مئة بالمئة - يعبر عن الجودة
      '✨', // بريق - يعبر عن التميز
      '🔥', // نار - يعبر عن العروض الساخنة
      '🚀', // صاروخ - يعبر عن السرعة
      '🌟', // نجمة - يعبر عن التفوق
      '🛍️', // حقيبة تسوق - يعبر عن الشراء
      '📣', // مكبر صوت - يعبر عن الإعلان
      '⚡', // صاعقة - يعبر عن العروض القوية
      '🔔', // جرس - يعبر عن التنبيه بالعروض
      '🏷️', // بطاقة خصم - يعبر عن التخفيضات
      '🌟', // نجمة - يعبر عن التفوق];
];

    // مولد عشوائي
    final Random random = Random();

    // بناء العناصر
    final List<Widget> imageSliders =
        banners
            .map(
              (items) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(16)),
                  child: Stack(
                    clipBehavior: Clip.none,
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
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8.0,
                                  ),
                                  child: Text(
                                    items.bannersTitle ?? '',
                                    maxLines: 1,
                                    textDirection: TextDirection.rtl,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontFamily:
                                          GoogleFonts.cairo(
                                            fontWeight: FontWeight.w900,
                                          ).fontFamily,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8.0,
                                  ),
                                  child: Text(
                                    items.bannersDescription ?? '',
                                    maxLines: 1,
                                    textDirection: TextDirection.rtl,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.white,
                                      fontFamily:
                                          GoogleFonts.cairo(
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
                      Positioned(
                        top: 0,
                        // right: 0,
                        left:0,
                        child: CircleAvatar(
                          backgroundColor: Colors.transparent,
                          radius: 15,
                          child: Text(
                            actionString[random.nextInt(actionString.length)],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
            .toList().reversed.toList();

    return RepaintBoundary(
      child: CarouselSlider(
        options: CarouselOptions(
          viewportFraction: 0.9,
          aspectRatio: 3,
          enableInfiniteScroll: true,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 5),
        ),
        items: imageSliders,
      ),
    );
  }
}
