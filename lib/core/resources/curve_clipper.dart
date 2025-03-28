import 'package:flutter/material.dart';

class InwardCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    double curveHeight = 30.0;

    path.lineTo(0, size.height - curveHeight);
    path.quadraticBezierTo(
      size.width / 2, size.height + curveHeight,
      size.width, size.height - curveHeight,
    );
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}