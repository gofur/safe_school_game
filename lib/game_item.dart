import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:safe_school_game/models/game.dart';

class GameItem extends StatelessWidget {
  final Game game;
  const GameItem({Key? key, required this.game}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      // color: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        height: 200,
        width: 250,
        decoration:  BoxDecoration(
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
                      decoration:  BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(14)),
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
                        child: AutoSizeText(
                      game.titleIcon,
                      maxLines: 2,
                      style: const TextStyle(color: Colors.white),
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
}