import 'package:fada_alhalij_web/core/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../resources/assets_manager.dart';

class CustomWebViewMobile extends StatefulWidget {
  const CustomWebViewMobile({super.key, required this.url});
  final String url;
  @override
  State<CustomWebViewMobile> createState() => _CustomWebViewMobileState();
}

class _CustomWebViewMobileState extends State<CustomWebViewMobile> {
  late final WebViewController _controller;
  @override
  void initState() {
    super.initState();
    _controller =
    WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(widget.url));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('الشروط والأحكام'),
      //   backgroundColor: Color(0xFF009688),
      //   actions: [
      //     Image.asset(Assets.logo3, ),
      //
      //
      //   ],
      //   leading: Padding(
      //     padding: const EdgeInsets.all(4.0),
      //     child: InkWell(
      //       onTap: () {
      //       Navigator.pop(context);
      //       },
      //       child: Container(
      //         height: 20,
      //         width: 20,
      //         padding: EdgeInsets.only(right: 7),
      //         decoration: BoxDecoration(
      //           shape: BoxShape.circle,
      //           border: Border.all(color: Colors.grey.shade200),
      //           color: Colors.white,
      //         ),
      //         child: Center(
      //           child: Icon(
      //             Icons.arrow_back_ios,
      //             size: 22,
      //             color: Colors.grey.shade700,
      //           ),
      //         ),
      //       ),
      //     ),
      //   ),
      //   centerTitle: true,
      // ),
      body: Stack(
        children: [

          WebViewWidget(controller: _controller),
          Positioned(
            top: 15,
            right: 15,
           child:SafeArea(
             child: InkWell(
               onTap: () {
                 Navigator.pop(context);
               },
               child: Container(
                 height: 40,
                 width: 40,
                 padding: EdgeInsets.only(right: 7),
                 decoration: BoxDecoration(
                   shape: BoxShape.circle,
                   border: Border.all(color: Colors.grey.shade200),
                   color:ColorManager.white
                 ),
                 child: Center(
                   child: Icon(
                     Icons.arrow_back_ios,
                     size: 22,
                     color: Colors.grey.shade700,
                   ),
                 ),
               ),
             ),
           )
          ),
          Positioned(
              top: 15,
              left: 15,
           child:SafeArea(
             child: Container(
               height: 40,
               width: 40,
               padding: EdgeInsets.only(right: 7),
               // decoration: BoxDecoration(
               //   shape: BoxShape.circle,
               //   border: Border.all(color: Colors.grey.shade200),
               //   // color: ColorManager.primaryColor,
               // ),
               child: Center(
                 child: Image.asset(Assets.logo3, ),
               ),
             ),
           )
          ),
        ],
      ),
    );

  }
}