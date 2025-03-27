import 'package:fada_alhalij_web/core/functions/launch_url.dart';
import 'package:fada_alhalij_web/core/resources/color_manager.dart';
import 'package:fada_alhalij_web/core/resources/style_manager.dart';
import 'package:fada_alhalij_web/core/utils/cashed_data_shared_preferences.dart';
import 'package:fada_alhalij_web/features/layout/presentation/widgets/custom_floating_action.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/resources/app_constants.dart';
import '../cubit/layout_cubit.dart';
import 'custom_button_navigation_bar.dart';

class LayoutMobileView extends StatelessWidget {
  const LayoutMobileView({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = LayoutCubit.get(context);
    return BlocBuilder<LayoutCubit, LayoutState>(
      builder: (context, state) {
        return Scaffold(
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: CustomFloatingAction(),
          body: Stack(
            children: [
              IndexedStack(
                index: cubit.index,
                children: AppConstants.viewOptions,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: CustomBottomNavigationBar(
                  currentIndex: cubit.index,
                  onItemTapped: (index) {
                    cubit.changeIndex(index);
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}


