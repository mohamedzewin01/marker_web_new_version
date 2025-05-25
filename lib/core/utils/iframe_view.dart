// // import 'dart:html';
// import 'dart:ui' as ui;
// import 'package:flutter/foundation.dart' show kIsWeb;
//
// class IframeView {
//   static void registerViewFactory(String viewId, String url) {
//     if (!kIsWeb) return; // تأكد إن الكود ينفذ فقط على الويب
//
//     // ignore: undefined_prefixed_name
//     ui.platformViewRegistry.registerViewFactory(
//       viewId,
//           (int viewId) {
//         final iframe = IFrameElement()
//           ..src = url
//           ..style.border = 'none'
//           ..style.width = '100%'
//           ..style.height = '100%';
//         return iframe;
//       },
//     );
//   }
// }
//
//
// ///TODO: iframe_view   when web app