import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:fada_alhalij_web/core/di/di.dart';
import 'package:fada_alhalij_web/core/functions/show_auth_action_sheet.dart';
import 'package:fada_alhalij_web/core/resources/color_manager.dart';
import 'package:fada_alhalij_web/core/resources/routes_manager.dart';
import 'package:fada_alhalij_web/core/resources/style_manager.dart';
import 'package:fada_alhalij_web/core/utils/cashed_data_shared_preferences.dart';
import 'package:fada_alhalij_web/core/widgets/custom_app_bar.dart';
import 'package:fada_alhalij_web/core/widgets/custom_elevated_button.dart';
import 'package:fada_alhalij_web/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import '../../../../core/resources/assets_manager.dart';
import '../widgets/profileList.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  late ProfileCubit viewModel;

  @override
  void initState() {
    viewModel = getIt.get<ProfileCubit>();
    viewModel.getProfile();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String name = CacheService.getData(key: CacheConstants.userName) ?? "";
    String mail = CacheService.getData(key: CacheConstants.userEmail) ?? "";
    String phone = CacheService.getData(key: CacheConstants.userPhone) ?? "";
    return Scaffold(
      appBar: CustomAppBar(title: "الحساب"),
      body: SingleChildScrollView(
        child: BlocProvider.value(
          value: viewModel,
          child: Column(
            children: [
              BlocBuilder<ProfileCubit, ProfileState>(
                builder: (context, state) {
                  if (state is ProfileSuccess) {
                    var user = state.getUserInfoEntity.user;
                    return Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Icon(
                            Icons.person,
                            size: 100,
                            color: ColorManager.primaryColor,
                          ),
                        ),
                        Text(
                          user?.name ?? '',
                          style: getSemiBoldStyle(
                            color: ColorManager.secondaryColor,
                            fontSize: 16,
                          ),
                        ),
                        user?.email == ''
                            ? const SizedBox()
                            : Text(
                              user?.email ?? '',
                              style: getSemiBoldStyle(
                                color: ColorManager.secondaryColor,
                                fontSize: 16,
                              ),
                              textDirection: TextDirection.ltr,
                            ),
                        Text(
                          user?.phone ?? '',
                          style: getSemiBoldStyle(
                            color: ColorManager.placeHolderColor2,
                            fontSize: 14,
                          ),
                          textDirection: TextDirection.ltr,
                        ),
                        const SizedBox(height: 16),
                      ],
                    );
                  }
                  return Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Icon(
                          Icons.person,
                          size: 100,
                          color: ColorManager.primaryColor,
                        ),
                      ),

                      const SizedBox(height: 16),
                    ],
                  );
                },
              ),

              const Divider(thickness: 0.1),
              const SizedBox(height: 10),

              /// -- MENU
              ProfileMenuWidget(
                title: "الملف الشخصي",
                icon: Icons.account_circle,
                onPress: () {
                  if (isActiveUser) {
                     showProfileOptions(context);

                  } else {
                    showAuthActionSheet(context);
                  }
                },
              ),

              ProfileMenuWidget(
                title: "ادارة العناوين",
                icon: Icons.delivery_dining,
                onPress: () {
                  if (isActiveUser) {
                    Navigator.pushNamed(context, RoutesManager.addressPage);
                  } else {
                    showAuthActionSheet(context);
                  }
                },
              ),
              const Divider(thickness: 0.1),
              const SizedBox(height: 10),
              ProfileMenuWidget(
                title: "الشروط والأحكام",
                icon: Icons.info,
                onPress: () {
                  if (kIsWeb) {
                    Navigator.pushNamed(context, RoutesManager.termsViewWeb);
                  } else {
                    Navigator.pushNamed(context, RoutesManager.termsView);
                  }
                },
              ),
              ProfileMenuWidget(
                title: "من نحن",
                icon: Icons.developer_mode_rounded,
                endIcon: false,
                onPress: () {
                  if (kIsWeb) {
                    Navigator.pushNamed(context, RoutesManager.aboutViewWeb);
                  } else {
                    Navigator.pushNamed(context, RoutesManager.aboutView);
                  }
                },
              ),
              const Divider(thickness: 0.1),
              const SizedBox(height: 10),

              const SizedBox(height: 55),
            ],
          ),
        ),
      ),
    );
  }
}

void showProfileOptions(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder:
        (context) => Container(
          padding: const EdgeInsets.all(16.0),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.0),
              topRight: Radius.circular(16.0),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min, // يجعل الارتفاع يناسب المحتوى فقط
            children: [
              ListTile(
                leading: const Icon(Icons.edit, color: Colors.blue),
                title: const Text("تعديل البيانات الشخصية"),
                onTap: () async {
                  Navigator.pop(context);
                  final result = await Navigator.pushNamed(
                    context,
                    RoutesManager.editInfoUserForm,
                  );

                  if (result == true && context.mounted) {
                    context.read<ProfileCubit>().getProfile();
                  }
                },
              ),
              ListTile(
                leading: const Icon(Icons.lock, color: Colors.blue),
                title: const Text("تغيير كلمة المرور"),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.exit_to_app, color: Colors.red),
                title: const Text("تسجيل الخروج"),
                onTap: () {
                  CacheService.clearItems();
                  isActiveUser = false;
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
  );
}

void showMultipleLocationOptions(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder:
        (context) => Container(
          padding: const EdgeInsets.all(16.0),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.0),
              topRight: Radius.circular(16.0),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.location_on, color: Colors.blue),
                title: const Text("إضافة موقع جديد"),
                onTap: () {
                  Navigator.pop(context); // إغلاق الـ Bottom Sheet
                  // أضف التنقل إلى صفحة إضافة الموقع
                },
              ),
              ListTile(
                leading: const Icon(Icons.list, color: Colors.blue),
                title: const Text("عرض المواقع المحفوظة"),
                onTap: () {
                  Navigator.pop(context); // إغلاق الـ Bottom Sheet
                  // أضف التنقل إلى صفحة عرض المواقع المحفوظة
                },
              ),
            ],
          ),
        ),
  );
}
