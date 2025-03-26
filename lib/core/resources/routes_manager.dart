import 'package:flutter/material.dart';
import '../../features/home/presentation/pages/home_view.dart';
import '../../features/home/presentation/widgets/all_best_deals.dart';
import '../../features/home/presentation/widgets/best_deals_adaptive.dart';
import '../../features/layout/presentation/pages/layout_view.dart';
import '../../splash.dart';


class RoutesManager {

  static const String splashScreen = '/';

  static const String homeScreen = '/home';
  static const String layout = '/layout';
  static const String categories = '/categories';
  static const String allBestDealsView = '/AllBestDealsView';
  static const String bestDealsAdaptive = '/BestDealsAdaptive';
  static const String profile = '/profile';
}


class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesManager.splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case RoutesManager.layout:
        return MaterialPageRoute(builder: (_) => const LayoutScreen());
      case RoutesManager.homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeView());
      case RoutesManager.bestDealsAdaptive:
        return MaterialPageRoute(builder: (_) => const BestDealsAdaptive(),settings: settings);
      case RoutesManager.allBestDealsView:
        return MaterialPageRoute(builder: (_) => const AllBestDealsView(),settings: settings);



      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: const Text("No Route Found"),
              ),
              body: const Center(child: Text("No Route Found")),
            ),);
  }
}
