import 'package:fada_alhalij_web/core/utils/iframe_view.dart';
import 'package:flutter/material.dart';

class AboutViewWeb extends StatefulWidget {
  const AboutViewWeb({super.key});

  @override
  State<AboutViewWeb> createState() => _AboutViewWebState();
}

class _AboutViewWebState extends State<AboutViewWeb> {

  final String termsUrl = "https://nextlaunch.artawiya.com/about.html";

  final String viewId = 'iframeElement';

  @override
  void initState() {
    super.initState();


    IframeView.registerViewFactory(viewId, termsUrl);

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('الشروط والأحكام'),
          backgroundColor: const Color(0xFF009688),
        ),
        body: HtmlElementView(viewType: viewId)

    );
  }
}