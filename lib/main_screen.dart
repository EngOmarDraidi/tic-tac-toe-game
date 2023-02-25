import 'package:flutter/material.dart';
import 'game/board.dart';
import 'game/game_score.dart';
import 'game/current_player.dart';
import 'game/refresh_button.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Spacer(flex: 3),
            GameScore(),
            Spacer(),
            Board(),
            Spacer(),
            CurrentPlayer(),
            Spacer(),
            RefreshButton(),
            Spacer()
          ],
        ),
      ),
    );
  }
}
