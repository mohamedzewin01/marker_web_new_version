import 'package:fada_alhalij_web/core/widgets/custom_web_view_mobile.dart';
import 'package:flutter/material.dart';


class TermsView extends StatelessWidget {
  const TermsView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomWebViewMobile(url: "https://nextlaunch.artawiya.com/terms.html");
  }
}


