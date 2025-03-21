import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fada_alhalij_web/core/resources/color_manager.dart';

class SearchTextFiled extends StatelessWidget {
  const SearchTextFiled({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: TextField(
        textAlignVertical: TextAlignVertical.center,
        readOnly: true,
        onTap: () {
          /// ToDo: search
          log('go => search');
        },
        decoration: InputDecoration(
          border: OutlineInputBorder(
              borderSide: BorderSide(
                  style: BorderStyle.solid, color: ColorManager.white2),
              borderRadius: BorderRadius.all(Radius.circular(8))),
          hintText: "What are u looking for ?",
          hintStyle: TextStyle(
              fontSize: 14,
              color: ColorManager.grey,
              fontWeight: FontWeight.w500),
          contentPadding: EdgeInsets.symmetric(vertical: 0),
          prefixIcon: Icon(
            CupertinoIcons.search,
            color: ColorManager.primaryColor,
          ),
          suffixIcon: InkWell(
            onTap: () {
              /// ToDo: search
              log('go => search');
            },
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 16, 0),
              child: Icon(
                CupertinoIcons.camera,
                color: ColorManager.grey,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
