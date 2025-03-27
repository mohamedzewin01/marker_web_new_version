import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/adaptive layout.dart';
import '../../../app_search/presentation/bloc/search_cubit.dart';
import '../cubit/layout_cubit.dart';
import '../widgets/desktop.dart';
import '../widgets/mobile.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LayoutCubit(),
        ),
        BlocProvider(create: (context) => SearchCubit(),)
      ],

        child: AdaptiveLayout(
          mobileLayout: (context) => const LayoutMobileView(),
          tabletLayout: (context) => const DesktopLayout(),
          desktopLayout: (context) => const Center(child: DesktopLayout()),
        ));
  }
}
