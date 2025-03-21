import 'package:flutter/material.dart';
import 'package:fada_alhalij_web/core/resources/color_manager.dart';

import 'core/resources/assets_manager.dart';
import 'core/resources/routes_manager.dart';
import 'core/resources/style_manager.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    movedToNextPage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              Assets.logo,
              scale: 2.5,
            ),
             FittedBox(
               fit: BoxFit.scaleDown,
               child: Text(
                "تموينات فضاء الخليج",
                style:getSemiBoldStyle(color: ColorManager.white, fontSize: 24),),
             )
          ],
        ),
      ),
    );
  }

  void movedToNextPage() {
    Future.delayed(
      const Duration(seconds: 2),
      () {
        if (mounted) {
          Navigator.pushReplacementNamed(context, RoutesManager.layout);
        }
      },
    );
  }
}
