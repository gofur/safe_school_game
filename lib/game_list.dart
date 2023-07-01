import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:safe_school_game/utils/custom_appbar.dart';

class GameList extends StatelessWidget {
  const GameList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
        child: SafeArea(
            child: Scaffold(
      appBar: const CustomAppBar(
        preferredHeight: 100,
      ),
      body: Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(50),
                        bottomRight: Radius.circular(50)),
                    color: Color(0xFFE51C8B),
                  ),
                  child: AutoSizeText(
                  "Permainan Pilihan".toUpperCase(),
                  style: const TextStyle(
                      fontFamily: "Monserrat",
                      color: Colors.white,
                      fontSize: 24.0,
                      decoration: TextDecoration.none),
                  textAlign: TextAlign.center,
                ),
              ),
            ),

            const Padding(
              padding: EdgeInsets.only(left: 16.0),
              child: AutoSizeText(
                "Belajar Mengenali Bencana",
                style: TextStyle(
                    fontFamily: "Monserrat",
                    color: Color(0xFF2D74B6),
                    fontSize: 24.0,
                    decoration: TextDecoration.none),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    )));
  }
}
