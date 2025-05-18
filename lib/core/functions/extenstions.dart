import 'package:flutter/material.dart';

extension MediaQueryHelper on BuildContext {
  double get screenHeight => MediaQuery.of(this).size.height;

  double get screenWidth => MediaQuery.of(this).size.width;
}

enum SortOrder {
  asc,
  desc,
}

extension SortOrderExtension on SortOrder {
  String get value {
    switch (this) {
      case SortOrder.asc:
        return "asc";
      case SortOrder.desc:
        return "desc";
    }
  }
}
