
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/analytics/analytics_helper.dart';
import 'l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fada_alhalij_web/core/resources/routes_manager.dart';
import 'package:fada_alhalij_web/utils/myTheme.dart';
import 'core/di/di.dart';
import 'core/utils/cashed_data_shared_preferences.dart';
import 'core/utils/my_bloc_observer.dart';
import 'localization/locale_cubit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheService.cacheInitialization();
  configureDependencies();
  Bloc.observer = MyBlocObserver();
  AnalyticsHelper.sendAnalytics();
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
              Locale('ar'),
              Locale('en'),

            ],
            theme: AppThemes.lightTheme1,
            themeMode: ThemeMode.light,
            debugShowCheckedModeBanner: false,
            onGenerateRoute: RouteGenerator.getRoute,
            initialRoute: RoutesManager.layout,
            // home: ProductScreen(),
            // home: SplashScreen(),
          );
        },
      ),
    );
  }
}
