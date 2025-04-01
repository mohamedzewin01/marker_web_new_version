import 'package:fada_alhalij_web/features/best_deals/presention/pages/best_deals_view.dart';
import 'package:flutter/material.dart';


import '../../features/categories/presentation/pages/categories.dart';
import '../../features/home/presentation/pages/home_view.dart';


class AppConstants {
  static const int listGenerate = 6;
  static const viewOptions = <Widget>[
    HomeView(),
    BestDealsView(),
    Categories(),
  ];
}
