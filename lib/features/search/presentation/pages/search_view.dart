import 'package:fada_alhalij_web/core/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:CustomAppBar(title:  "بحث"),
      body: const Center(child: Text("Search Page")),
    );
  }
}
