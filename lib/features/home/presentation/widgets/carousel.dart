import 'package:carousel_slider/carousel_slider.dart';
import 'package:fada_alhalij_web/core/resources/style_manager.dart';
import 'package:flutter/material.dart';

import '../../../../core/resources/assets_manager.dart';

class Carousel extends StatelessWidget {
  Carousel({super.key});

  final List<AssetImage> imgList = [
    AssetImage(Assets.imagesBanner1),
    AssetImage(Assets.imagesBanner2),
    AssetImage(Assets.imagesBanner3),
  ];

  @override
  Widget build(BuildContext context) {
    final List<Widget> imageSliders =
        imgList
            .map(
              (item) => ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(16)),
                child: Stack(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width - 48,
                      decoration: BoxDecoration(color: Colors.orange),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(18),
                                  bottomLeft: Radius.circular(18),
                                ),
                                color: Colors.green,
                                image: DecorationImage(
                                  image: NetworkImage('https://img.freepik.com/free-vector/bright-origami-banners_23-2147508001.jpg?uid=R149659870&ga=GA1.1.427823544.1742272046&semt=ais_keywords_boost'), // استبدل 'src' برابط الصورة الصحيح
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),

                          ),

                          Container(
                           width:  MediaQuery.of(context).size.width /2.5,
                            decoration: BoxDecoration(
                                color: Colors.orange,


                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('اشتري الان',style: getSemiBoldStyle(color: Colors.white,fontSize: 18),),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
            .toList();
    return RepaintBoundary(
      child: CarouselSlider(
        options: CarouselOptions(
          viewportFraction: 0.9,
          aspectRatio: 4,
          enableInfiniteScroll: true,
          initialPage: 2,
          autoPlay: false,
          autoPlayInterval: Duration(seconds: 5),
        ),
        items: imageSliders,
      ),
    );
  }
}
