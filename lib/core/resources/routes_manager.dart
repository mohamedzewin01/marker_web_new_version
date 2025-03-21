import 'package:flutter/material.dart';

import '../../features/auth/presentation/pages/registration.dart';
import '../../features/categories/presentation/pages/categories.dart';
import '../../features/home/presentation/pages/home_view.dart';
import '../../features/layout/presentation/pages/layout_view.dart';
import '../../features/profile/presentation/pages/profile.dart';
import '../../splash.dart';


class RoutesManager {
  static const String welcomeScreen = '/welcomeScreen';
  static const String splashScreen = '/';
  static const String registrationScreen = '/registration';
  static const String homeScreen = '/home';
  static const String layout = '/layout';
  static const String categories = '/categories';
  static const String cartScreen = '/cart';
  static const String profile = '/profile';
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesManager.splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case RoutesManager.layout:
        return MaterialPageRoute(builder: (_) => const LayoutScreen());

      case RoutesManager.registrationScreen:
        return MaterialPageRoute(builder: (_) => const RegistrationScreen());
      // case RoutesManager.homeScreen:
      //   return MaterialPageRoute(builder: (_) => const HomeScreen());
      case RoutesManager.homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeView());
      case RoutesManager.categories:
        return MaterialPageRoute(builder: (_) => const Categories());
      // case RoutesManager.cartScreen:
      //   return MaterialPageRoute(builder: (_) => const CartScreen());
      case RoutesManager.profile:
        return MaterialPageRoute(builder: (_) => const Profile());

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
            ));
  }
}
