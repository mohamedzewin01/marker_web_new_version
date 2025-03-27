
import 'dart:ui';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:fada_alhalij_web/core/api/api_constants.dart';
import 'package:http/http.dart' as http;
import 'package:share_plus/share_plus.dart';

class CustomLaunchUrl {
  static Future<void> launchUrlShare({
    required String title,
    required String urlPreview,
    String? details,
    String? phone,
  }) async {
    try {
      // بناء رابط الصورة
      Uri url = Uri.parse('${ApiConstants.baseUrlImage}$urlPreview');

      // تحميل الصورة من الرابط
      var response = await http.get(url);

      // مشاركة الصورة مع النصوص
      await Share.shareXFiles(
        [
          XFile.fromData(
            response.bodyBytes,
            name: title,
            mimeType: 'image/png',
          ),
        ],
        subject: 'فضاء الخليج - ${title.trim()}',
        text: '''
         ---------------         
         
        📌 ${title.trim()}
          
          📄 التفاصيل:
          $details
          
          📞 للتواصل: 0547884523
          
                   ---------------         
          
          🌐 https://marketfadaalhalij.artawiya.com/
      
      تطبيق فضاء الخليج
            ''',
        sharePositionOrigin: Rect.fromCircle(
          center: Offset(10, 10),
          radius: 20,
        ),
      );
    } catch (e) {
      print('Error while sharing: $e');
    }
  }


  static Future<void> launchUrlShareApp({
    required String title,
    required String urlPreview,
    String? details,
    String? phone,
  }) async {
    final String shareText = '''
           
📌 ${title.trim()}

📄 التفاصيل:
$details

📞 للتواصل: $phone
            ⚡💯💯💯💯💯💯💯⚡
🌐 https://marketfadaalhalij.artawiya.com/
           ⚡💯💯💯💯💯💯💯⚡

      ''';

    if (kIsWeb) {
      // مشاركة النصوص والرابط فقط على الويب
      await Share.share(shareText);
    } else {
      try {
        // بناء رابط الصورة
        Uri url = Uri.parse('${ApiConstants.baseUrlImage}$urlPreview');

        // تحميل الصورة
        var response = await http.get(url);

        // مشاركة الصورة مع النصوص على المنصات الأخرى
        await Share.shareXFiles(
          [
            XFile.fromData(
              response.bodyBytes,
              name: title,
              mimeType: 'image/png',
            ),
          ],
          subject: 'فضاء الخليج - ${title.trim()}',
          text: shareText,
          sharePositionOrigin: Rect.fromCircle(
            center: Offset(10, 10),
            radius: 20,
          ),
        );
      } catch (e) {
      throw('Error while sharing: $e');
      }
    }
  }


//   static Future<void> launchUrlShareApp({
//     required String title,
//     required String urlPreview,
//     String? details,
//     String? phone,
//   }) async {
//     try {
//       // بناء رابط الصورة
//       Uri url = Uri.parse('${ApiConstants.baseUrlImage}$urlPreview');
//
//       // تحميل الصورة من الرابط
//       var response = await http.get(url);
//
//       // مشاركة الصورة مع النصوص
//       await Share.shareXFiles(
//         [
//           XFile.fromData(
//             response.bodyBytes,
//             name: title,
//             mimeType: 'image/png',
//           ),
//         ],
//         subject: 'فضاء الخليج - ${title.trim()}',
//         text: '''
//
//
// 📌 ${title.trim()}
//
// 📄 التفاصيل:
// $details
//
// 📞 للتواصل:  0547884523
//             ⚡💯💯💯💯💯💯💯⚡
// 🌐 https://marketfadaalhalij.artawiya.com/
//            ⚡💯💯💯💯💯💯💯⚡
//
//       ''',
//         sharePositionOrigin: Rect.fromCircle(
//           center: Offset(10, 10),
//           radius: 20,
//         ),
//       );
//     } catch (e) {
//       print('Error while sharing: $e');
//     }
//   }


  static Future<void> launchUrlShareWeb({
    required String title,
    required String urlPreview,
    String? details,
    String? phone,
  }) async {
    if (kIsWeb) {
      // دعم للويب
      final shareText = '''
          ${title.trim()}
          $details
          $phone
          ---------------
          تطبيق فضاء الخليج
          https://marketfadaalhalij.artawiya.com/
          ''';
      await Share.share(shareText);
    } else {
      // دعم للموبايل والـ Desktop
      try {
        Uri url = Uri.parse('${ApiConstants.baseUrlImage}$urlPreview');

        // تحميل الصورة من الرابط
        var response = await http.get(url);

        // مشاركة الصورة مع النصوص
        await Share.shareXFiles(
          [
            XFile.fromData(
              response.bodyBytes,
              name: title,
              mimeType: 'image/png',
            ),
          ],
          subject: ' ${title.trim()}',
          text: '''
           
         
📌 ${title.trim()}

📄 التفاصيل:
$details

📞 للتواصل:  0547884523
            ⚡💯💯💯💯💯💯💯⚡
🌐 https://marketfadaalhalij.artawiya.com/
           ⚡💯💯💯💯💯💯💯⚡

      ''',
          sharePositionOrigin: Rect.fromCircle(
            center: Offset(10, 10),
            radius: 20,
          ),
        );
      } catch (e) {
        print('Error sharing: $e');
      }
    }
  }

  // ///launchUrlCall
  // static Future<void> launchUrlCall(
  //     {required numPhone, String? messageSms}) async {
  //   var androidUrl = 'tel:+$numPhone';
  //   var iosUrl = 'tel:+$numPhone';
  //   try {
  //     if (Platform.isIOS) {
  //       await launchUrl(Uri.parse(iosUrl));
  //     } else if (Platform.isAndroid) {
  //       await launchUrl(Uri.parse(androidUrl));
  //     }
  //   } catch (e) {
  //     print(e.toString());
  //   }
  // }
  //
  // ///launchUrlLocation
  // static Future<void> launchUrlLocation({
  //   required String location,
  // }) async {
  //   var uri = Uri.parse(location);
  //   if (await canLaunchUrl(uri)) {
  //     await launchUrl(uri, mode: LaunchMode.externalApplication);
  //   } else {
  //     throw 'Could not open the map.';
  //   }
  // }
  //
  // static Future<void> launchUserPolicy() async {
  //   var webUrl = "$launchPolicy/UserPolicy.php";
  //
  //   try {
  //     await launchUrl(Uri.parse(webUrl));
  //   } catch (e) {
  //     print(e.toString());
  //   }
  // }
  // static Future<void> launchShopPolicy() async {
  //   var webUrl = "$launchPolicy/ShopPolicy.php";
  //
  //   try {
  //     await launchUrl(Uri.parse(webUrl));
  //   } catch (e) {
  //     print(e.toString());
  //   }
  // }
  // static Future<void> launchSellerPolicy() async {
  //   var webUrl = "$launchPolicy/SellerPolicy.php";
  //
  //   try {
  //     await launchUrl(Uri.parse(webUrl));
  //   } catch (e) {
  //     print(e.toString());
  //   }
  // }
}
