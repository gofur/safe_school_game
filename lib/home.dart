import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
      child: PreferredSize(
        preferredSize: const Size.fromHeight(150.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.lightBlue, width: 0.0)),
            height: 180,
          ),
          Expanded(
            child: Container(
              color: Colors.white,
              child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 0.0),
                    color: const Color(0xFFE51C8B),
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.elliptical(200, 160),
                    ),
                  ),
                  child: Column(children: [
                    Container(
                        padding: const EdgeInsets.only(
                            right: 16.0, left: 16.0, top: 100.0),
                        child: const Text(
                          "Selamat datang di permainan sekolah aman",
                          style: TextStyle(
                            fontFamily: "Monserrat",
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ))
                  ])),
            ),
          ),
        ]),
      ),
    );
  }
}
