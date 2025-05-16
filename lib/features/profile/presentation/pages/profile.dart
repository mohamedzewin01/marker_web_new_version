import 'package:fada_alhalij_web/core/resources/color_manager.dart';
import 'package:fada_alhalij_web/core/utils/cashed_data_shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import '../../../../core/resources/assets_manager.dart';
import '../widgets/profileList.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    String name = CacheService.getData(key: CacheConstants.userName) ?? "";
    String mail = CacheService.getData(key: CacheConstants.userEmail) ?? "";
    String phone = CacheService.getData(key: CacheConstants.userPhone) ?? "";
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              SizedBox(height: 40),
              Stack(
                children: [
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Image.asset(Assets.user),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: ColorManager.primaryColor,
                      ),
                      child: const Icon(
                        Icons.camera_alt_rounded,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Text(name, style: Theme.of(context).textTheme.headlineSmall),
              Text(
                mail,
                style: Theme.of(context).textTheme.bodySmall,
                textDirection: TextDirection.ltr,
              ),
              Text(
                phone,
                style: Theme.of(context).textTheme.bodySmall,
                textDirection: TextDirection.ltr,
              ),
              const SizedBox(height: 16),

              const Divider(thickness: 0.1),
              const SizedBox(height: 10),

              /// -- MENU
              ProfileMenuWidget(
                title: "الملف الشخصي",
                icon: Icons.account_circle,
                onPress: () {
                  showProfileOptions(context);
                },
              ),

              ProfileMenuWidget(
                title: "ادارة العناوين",
                icon: Icons.delivery_dining,
                onPress: () {
                  showDeliveryOptions(context);
                },
              ),
              ProfileMenuWidget(
                title: " المواقع المحفوظة",
                icon: Icons.settings,
                onPress: () {
                  showMultipleLocationOptions(context);
                },
              ),
              const Divider(thickness: 0.1),
              const SizedBox(height: 10),
              ProfileMenuWidget(
                title: "الشروط والأحكام",
                icon: Icons.info,
                onPress: () {},
              ),
              ProfileMenuWidget(
                title: "من نحن",
                icon: Icons.developer_mode_rounded,
                endIcon: false,
                onPress: () {},
              ),
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
    builder: (context) => Container(
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
            onTap: ()async {


            },
          ),
          ListTile(
            leading: const Icon(Icons.lock, color: Colors.blue),
            title: const Text("تغيير كلمة المرور"),
            onTap: () {
              Navigator.pop(context); // إغلاق الـ Bottom Sheet
              // أضف التنقل إلى صفحة تغيير كلمة المرور
            },
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app, color: Colors.red),
            title: const Text("تسجيل الخروج"),
            onTap: () {
              CacheService.clearItems();
              isActiveUser=false;

              Navigator.pop(context); // إغلاق الـ Bottom Sheet
              // أضف وظيفة تسجيل الخروج
            },
          ),
        ],
      ),
    ),
  );
}
void showDeliveryOptions(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (context) => Container(
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
            title: const Text("تعديل عنوان التوصيل"),
            onTap: () {
              Navigator.pop(context); // إغلاق الـ Bottom Sheet
              // أضف التنقل إلى صفحة تعديل العنوان
            },
          ),
          ListTile(
            leading: const Icon(Icons.list, color: Colors.blue),
            title: const Text("عرض العناوين المحفوظة"),
            onTap: () {
              Navigator.pop(context); // إغلاق الـ Bottom Sheet
              // أضف التنقل إلى صفحة العناوين المحفوظة
            },
          ),
          ListTile(
            leading: const Icon(Icons.directions_car, color: Colors.blue),
            title: const Text("تغيير طريقة التوصيل"),
            onTap: () {
              Navigator.pop(context); // إغلاق الـ Bottom Sheet
              // أضف التنقل إلى صفحة طرق التوصيل
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
    builder: (context) => Container(
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
