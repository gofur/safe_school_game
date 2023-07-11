import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:safe_school_game/game_detail.dart';
import 'package:safe_school_game/models/game.dart';
import 'package:safe_school_game/utils/webview.dart';
import 'package:url_launcher/url_launcher.dart';

class GameItem extends StatelessWidget {
  final Game game;
  const GameItem({Key? key, required this.game}) : super(key: key);

Future<void> _launchInWebViewOrVC(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.inAppWebView,
    )) {
      throw Exception('Could not launch $url');
    }
  }


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        // Pushing a route directly, WITHOUT using a named route
        Navigator.of(context).push(
          // With MaterialPageRoute, you can pass data between pages,
          // but if you have a more complex app, you will quickly get lost.
          MaterialPageRoute(
            builder: (context) => GameDetail(game: game),
          ),
        );
      },
      child: Card(
        elevation: 4.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Container(
          height: 200,
          width: 250,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            image: DecorationImage(
              image: AssetImage(
                game.image,
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
                  GestureDetector(
                    onTap: (){
                      // Navigator.of(context).push(MaterialPageRoute(
                      //   builder: (BuildContext context) =>
                      //       WebviewScaffold(url: game.url)));
                        Uri url = Uri.parse(game.url);

                      _launchInWebViewOrVC(url);
                    },
                    child: Padding(
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
                            child: const AutoSizeText(
                              "Main",
                              maxLines: 2,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "Monserrat",
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          )),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(14)),
                          image: DecorationImage(
                            image: AssetImage(
                              game.icon,
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 8.0,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            AutoSizeText(
                              game.title,
                              maxLines: 2,
                              style: const TextStyle(color: Colors.white),
                            ),
                            AutoSizeText(
                              game.author,
                              maxLines: 2,
                              style: const TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

class GameItemHorizontal extends StatelessWidget {
  final Game game;
  const GameItemHorizontal({Key? key, required this.game}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Pushing a route directly, WITHOUT using a named route
        Navigator.of(context).push(
          // With MaterialPageRoute, you can pass data between pages,
          // but if you have a more complex app, you will quickly get lost.
          MaterialPageRoute(
            builder: (context) => GameDetail(game: game),
          ),
        );
      },
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(14)),
            image: DecorationImage(
              image: AssetImage(
                game.icon,
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const Padding(padding: EdgeInsets.only(left: 16.0)),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              AutoSizeText(
                game.title,
                maxLines: 2,
                style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              AutoSizeText(
                game.author,
                maxLines: 2,
                style: const TextStyle(color: Colors.black),
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) =>
                    WebviewScaffold(url: game.url)));
          },
          child: Container(
            width: 60,
            padding: const EdgeInsets.all(8.0),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: Color(0xFFE51C8B),
            ),
            child: const AutoSizeText(
              "Main",
              maxLines: 2,
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: "Monserrat",
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ]),
    );
  }
}
