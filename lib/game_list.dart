import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:infinite_carousel/infinite_carousel.dart';
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
        child: Stack(children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(50),
                        bottomRight: Radius.circular(50)),
                    color: Color(0xFFE51C8B),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: AutoSizeText(
                      "Permainan Pilihan".toUpperCase(),
                      style: const TextStyle(
                          fontFamily: "Veneer",
                          color: Colors.white,
                          fontSize: 30.0,
                          decoration: TextDecoration.none),
                    ),
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
                  textAlign: TextAlign.left,
                ),
              ),
              const SizedBox(
                height: 8.0,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 16.0),
                child: AutoSizeText(
                  "Pelajari bencana melalui peta-peta yang menarik",
                  style: TextStyle(
                      fontFamily: "Monserrat",
                      color: Colors.black,
                      fontSize: 16.0,
                      decoration: TextDecoration.none),
                  textAlign: TextAlign.left,
                ),
              ),
              // const Horizontal(),
              const Center(child: CardGameItem())
            ],
          ),
          Positioned(
              bottom: 0.0,
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 60.0,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(50),
                        topLeft: Radius.circular(50)),
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
                          fontSize: 16.0,
                          decoration: TextDecoration.none),
                      textAlign: TextAlign.center,
                    ),
                  )))
        ]),
      ),
    )));
  }
}

class CardGameItem extends StatelessWidget {
  const CardGameItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(8.0),
        child: _buildImageCard(
            color: const Color(0xFF090943),
            cardExpiration: "08/2022",
            cardHolder: "HOUSSEM SELMI",
            cardNumber: "3546 7532 XXXX 9742"),
      ),
    );
  }

  // Build the credit card widget
  Card _buildImageCard(
      {required Color color,
      required String cardNumber,
      required String cardHolder,
      required String cardExpiration}) {
    return Card(
      elevation: 4.0,
      // color: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        height: 200,
        width: 250,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          image: DecorationImage(
            image: AssetImage(
              'assets/images/kuki/kuki.png',
            ),
            fit: BoxFit.cover,
          ),
        ),
        // padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 22.0),
        child: Stack(children: [
          Container(
              decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            gradient: LinearGradient(
                colors: [Colors.transparent, Color(0xFFE51C8B)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.2, 0.8]),
          )),
          Padding(
            padding:
                const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        width: 60,
                        padding: const EdgeInsets.all(8.0),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          color: Color(0xFFE51C8B),
                        ),
                        child: const Expanded(
                            child: AutoSizeText(
                          "Main",
                          maxLines: 2,
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Monserrat",
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold
                          ),
                          textAlign: TextAlign.center,
                        )),
                      )),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(14)),
                        image: DecorationImage(
                          image: AssetImage(
                            'assets/images/kuki/kuki.png',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 8.0,
                    ),
                    const Expanded(
                        child: AutoSizeText(
                      "Belajar Mengenali Bencana Diggo Team",
                      maxLines: 2,
                      style: TextStyle(color: Colors.white),
                    ))
                  ],
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }

// Build Column containing the cardholder and expiration information
  Column _buildDetailsBlock({required String label, required String value}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          label,
          style: const TextStyle(
              color: Colors.grey, fontSize: 9, fontWeight: FontWeight.bold),
        ),
        Text(
          value,
          style: const TextStyle(
              color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}