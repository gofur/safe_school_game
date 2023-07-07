import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:safe_school_game/game_item.dart';
import 'package:safe_school_game/resources/app_games.dart';
import 'package:safe_school_game/utils/custom_appbar.dart';

class GameList extends StatefulWidget {
  const GameList({Key? key}) : super(key: key);

  @override
  State<GameList> createState() => _GameListState();
}

class _GameListState extends State<GameList> {
  late PageController _pageController;
  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.8);
  }

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
        width: MediaQuery.of(context).size.width,
        child: Stack(children: [
          SingleChildScrollView(
            child: Column(
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
                const SizedBox(
                  height: 8.0,
                ),
                SizedBox(
                  height: 200,
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: appGames.length,
                    pageSnapping: true,
                    itemBuilder: (context, index) {
                      return GameItem(game: appGames[index]);
                    },
                  ),
                ),
                const SizedBox(
                  height: 8.0,
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 8.0, left: 16.0, right: 16.0),
                  child: AutoSizeText(
                    "Rekomendasi",
                    style: TextStyle(
                        fontFamily: "Monserrat",
                        color: Color(0xFFE51C8B),
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.none),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 16.0),
                  child: AutoSizeText(
                    "Permainan menarik dan juara harapan",
                    style: TextStyle(
                        fontFamily: "Monserrat",
                        color: Colors.black,
                        fontSize: 16.0,
                        decoration: TextDecoration.none),
                    textAlign: TextAlign.left,
                  ),
                ),
                const SizedBox(height: 8.0,),
                SizedBox(
                  child: Expanded(
                    child: ListView.builder(
                      // controller: _pageController,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                      itemCount: appGames.length,
                      itemBuilder: (context, index) {
                        return Expanded(child: GameItem(game: appGames[index]));
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 80,)
              ],
            ),
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
