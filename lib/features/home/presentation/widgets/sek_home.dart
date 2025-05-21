import 'package:fada_alhalij_web/core/resources/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';


class SkeHome extends StatelessWidget {
  const SkeHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: Scaffold(
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // بنر كبير
            Container(
              height: 120,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            const SizedBox(height: 16),

            // الأقسام
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('الأقسام', style: TextStyle(fontSize: 18)),
                Text('مشاهدة الكل', style: TextStyle(color: Colors.blue)),
              ],
            ),
            const SizedBox(height: 16),

            // دوائر الأقسام
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: List.generate(8, (index) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.grey[200],
                    ),
                    const SizedBox(height: 8),
                    Container(
                      width: 60,
                      height: 10,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        image: DecorationImage(
                          image:AssetImage(Assets.logo3),
                        )
                      ),

                    )
                  ],
                );
              }),
            ),
            const SizedBox(height: 32),

            // عرض بانر تحت الأقسام
            Container(
              height: 80,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            const SizedBox(height: 24),

            // عروض المنتجات
            Row(
              children: [
                Text('🔥🔥 العروض', style: TextStyle(fontSize: 18)),
                Spacer(),
                Text('مشاهدة الكل', style: TextStyle(color: Colors.blue)),
              ],
            ),
            const SizedBox(height: 16),

            // منتجات
            SizedBox(
              height: 180,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                separatorBuilder: (_, __) => const SizedBox(width: 16),
                itemBuilder: (context, index) {
                  return Container(
                    width: 120,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(12),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
