import 'package:fada_alhalij_web/features/about/about_view.dart';
import 'package:fada_alhalij_web/features/about/about_view_web.dart';
import 'package:fada_alhalij_web/features/address/presentation/pages/addresses_view.dart';
import 'package:fada_alhalij_web/features/auth/presentation/pages/auth_screen.dart';
import 'package:fada_alhalij_web/features/terms/terms_view.dart';
import 'package:fada_alhalij_web/features/terms/terms_view_web.dart';
import 'package:flutter/material.dart';
import '../../features/best_deals/presention/pages/best_deals_view.dart';
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
  static const String allBestDealsView = '/AllBestDeals';
  static const String bestDealsAdaptive = '/BestDealsAdaptive';
  static const String addressPage = '/AddressPage';
  static const String authScreen = '/AuthScreen';
  static const String bestDealsView = '/BestDeals';
  static const String termsView = '/TermsView';
  static const String aboutView = '/AboutView';
  static const String termsViewWeb = '/termsViewWeb';
  static const String aboutViewWeb = '/aboutViewWeb';
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
        return MaterialPageRoute(
          builder: (_) => const BestDealsAdaptive(),
          settings: settings,
        );
      case RoutesManager.addressPage:
        return MaterialPageRoute(
          builder: (_) => const AddressPage(),
          settings: settings,
        );
      case RoutesManager.authScreen:
        return MaterialPageRoute(
          builder: (_) => const AuthScreen(),
          settings: settings,
        );
      case RoutesManager.allBestDealsView:
        return MaterialPageRoute(
          builder: (_) => const AllBestDealsView(),
          settings: settings,
        );
      case RoutesManager.termsView:
        return MaterialPageRoute(
          builder: (_) => const TermsView(),

        );
      case RoutesManager.termsViewWeb:
        return MaterialPageRoute(
          builder: (_) => const TermsViewWeb(),

        );
      case RoutesManager.aboutView:
        return MaterialPageRoute(
          builder: (_) => const AboutView(),

        );
      case RoutesManager.aboutViewWeb:
        return MaterialPageRoute(
          builder: (_) => const AboutViewWeb(),

        );
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder:
          (_) => Scaffold(
            appBar: AppBar(title: const Text("No Route Found")),
            body: const Center(child: Text("No Route Found")),
          ),
    );
  }
}
