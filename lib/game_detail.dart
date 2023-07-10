import 'package:flutter/material.dart';
import 'package:safe_school_game/models/game.dart';
import 'package:safe_school_game/utils/custom_appbar.dart';


class GameDetail extends StatelessWidget {
  final Game game;
  const GameDetail({Key? key, required this.game}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
        child: SafeArea(
            child: Scaffold(
      appBar: const CustomAppBar(
        preferredHeight: 100,
      ),
      body: Container())));
  }
}