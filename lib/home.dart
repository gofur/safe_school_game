import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
      child: SafeArea(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Container(
            color: Colors.white,
            padding: const EdgeInsets.only(top: 80, bottom: 0.0),
            child: const AspectRatio(
              aspectRatio: 6 / 1,
              child: Image(
                image: AssetImage(
                  'assets/images/logo.png',
                ),
                width: 10,
                height: 10,
              ),
            ),
          ),
          Stack(
            children: [
              Container(
                color: Colors.white,
                child: Center(
                  child: CustomPaint(
                    painter: CurvePainter(),
                    child: const Center(
                        child: Padding(
                      padding: EdgeInsets.only(top: 140.0),
                    )),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 24, right: 24, top: 120),
                child: AutoSizeText(
                  "Selamat datang di permainan sekolah aman".toUpperCase(),
                  style: const TextStyle(
                      fontFamily: "Monserrat",
                      color: Colors.white,
                      fontSize: 36.0,
                      decoration: TextDecoration.none),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
          Expanded(
            child: Container(
              color: const Color(0xFFE51C8B),
              child: const SizedBox(
                width: double.infinity,
              ),
            ),
          ),
        ]),
      ),
    );
  }
}

class CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = const Color(0xFFE51C8B);
    // create a path
    Path path = Path();
    path.moveTo(0, size.height * 50 * 50);
    path.lineTo(0, size.height);
    path.quadraticBezierTo(
        size.width / 2, size.height - 180, size.width, size.height);
    path.lineTo(size.width, size.height);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
