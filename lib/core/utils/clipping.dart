import 'package:flutter/material.dart';

class Clipping extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path0 = Path();
    path0.moveTo(size.width * 0.5796000, 0);
    path0.quadraticBezierTo(size.width * 0.7034250, size.height * -0.0058750,
        size.width * 0.7019250, size.height * 0.0549500);
    path0.cubicTo(
        size.width * 0.7124750,
        size.height * 0.1472750,
        size.width * 0.8340250,
        size.height * 0.1425250,
        size.width * 0.8771500,
        size.height * 0.1475500);
    path0.quadraticBezierTo(size.width * 1.0012500, size.height * 0.1379000,
        size.width, size.height * 0.2479500);
    path0.lineTo(size.width, 0);
    path0.lineTo(size.width * 0.5796000, 0);
    path0.close();
    return path0;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}

// class ClipperContainer extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     Path path0 = Path();
//     path0.moveTo(0, size.height * 0.4200000);
//     path0.quadraticBezierTo(size.width * 0.0168750, size.height * 0.4812500,
//         size.width * 0.1225000, size.height * 0.4916667);
//     path0.cubicTo(
//         size.width * 0.2687500,
//         size.height * 0.4908333,
//         size.width * 0.6443750,
//         size.height * 0.4941667,
//         size.width * 0.8325000,
//         size.height * 0.4950000);
//     path0.cubicTo(
//         size.width * 1.0318750,
//         size.height * 0.4925000,
//         size.width * 1.0031250,
//         size.height * 0.5875000,
//         size.width,
//         size.height * 0.6150000);
//     path0.quadraticBezierTo(size.width * 1.0262500, size.height * 0.6158333,
//         size.width, size.height * 0.6183333);
//     path0.lineTo(size.width, size.height);
//     path0.lineTo(0, size.height);
//     path0.lineTo(0, size.height * 0.8650000);

//     return path0;
//   }

//   @override
//   bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
// }
