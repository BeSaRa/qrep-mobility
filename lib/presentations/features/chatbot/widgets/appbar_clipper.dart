import 'package:ebla/presentations/resources/resources.dart';
import 'package:flutter/material.dart';

class AppBarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - AppSizeH.s35);

    path.quadraticBezierTo(size.width / 4, size.height, size.width / 2,
        size.height - AppSizeH.s20);
    path.quadraticBezierTo(size.width * 3 / 4, size.height - AppSizeH.s40,
        size.width, size.height - AppSizeH.s20);

    path.lineTo(size.width, AppSizeH.s0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
