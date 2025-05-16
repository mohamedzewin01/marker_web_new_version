import 'package:fada_alhalij_web/core/widgets/custom_web_view_mobile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../core/utils/iframe_view.dart';

// class TermsView extends StatefulWidget {
//   const TermsView({super.key});
//
//   @override
//   State<TermsView> createState() => _TermsViewState();
// }
//
// class _TermsViewState extends State<TermsView> {
//   late final WebViewController _controller;
//   final String termsUrl = "https://nextlaunch.artawiya.com/terms.html";
//
//   final String viewId = 'iframeElement';
//
//   @override
//   void initState() {
//     super.initState();
//     //
//     // if (kIsWeb) {
//     //   IframeView.registerViewFactory(viewId, termsUrl);
//     // } else {
//       _controller = WebViewController()
//         ..setJavaScriptMode(JavaScriptMode.unrestricted)
//         ..loadRequest(Uri.parse(termsUrl));
//     // }
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('الشروط والأحكام'),
//         backgroundColor: const Color(0xFF009688),
//       ),
//       body:
//       //kIsWeb
//         //  ? HtmlElementView(viewType: viewId)
//        //   :
//         WebViewWidget(controller: _controller),
//     );
//   }
// }


class TermsView extends StatelessWidget {
  const TermsView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomWebViewMobile(url: "https://nextlaunch.artawiya.com/terms.html");
  }
}


