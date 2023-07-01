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
      body: Container(color: Colors.white, child: const Text("Game List")),
    )));
  }
}
