import 'package:fada_alhalij_web/core/utils/iframe_view.dart';
import 'package:flutter/material.dart';

class TermsViewWeb extends StatefulWidget {
  const TermsViewWeb({super.key});

  @override
  State<TermsViewWeb> createState() => _TermsViewWebState();
}

class _TermsViewWebState extends State<TermsViewWeb> {

  final String termsUrl = "https://nextlaunch.artawiya.com/terms.html";

  final String viewId = 'iframeElement';

  @override
  void initState() {
    super.initState();

    /// TODO: iframe_view   when web app
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