import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fada_alhalij_web/core/resources/routes_manager.dart';
import 'package:fada_alhalij_web/utils/myTheme.dart';
import 'package:device_preview/device_preview.dart';
import 'core/di/di.dart';
import 'core/utils/cashed_data_shared_preferences.dart';
import 'core/utils/my_bloc_observer.dart';

import 'localization/locale_cubit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheService.cacheInitialization();
  configureDependencies();
  Bloc.observer = MyBlocObserver();
  // await initDependencies();
  runApp(
    MyApp(),
  );
  // runApp(DevicePreview(
  //   enabled: !kReleaseMode,
  //   builder: (context) => MyApp(),
  // ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LocaleCubit(),
      child: BlocBuilder<LocaleCubit, Locale>(
        builder: (context, locale) {
          return MaterialApp(
            locale: locale,
            localizationsDelegates: [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: [
              Locale('en'),
              Locale('ar'),
            ],
            theme: AppThemes.lightTheme1,
            themeMode: ThemeMode.light,
            debugShowCheckedModeBanner: false,
            onGenerateRoute: RouteGenerator.getRoute,
            initialRoute: RoutesManager.splashScreen,
            // home: SplashScreen(),
          );
        },
      ),
    );
  }
}
