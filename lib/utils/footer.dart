import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: 0.0,
        child: Container(
            width: MediaQuery.of(context).size.width,
            height: 50.0,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(50), topLeft: Radius.circular(50)),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: const Center(
              child: AutoSizeText(
                "© 2023 Yayasan Plan International Indonesia",
                style: TextStyle(
                    fontFamily: "Monserrat",
                    color: Colors.black,
                    fontSize: 14.0,
                    decoration: TextDecoration.none),
                textAlign: TextAlign.center,
              ),
            )));
  }
}
