import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xo_game/controllers/game_controller.dart';

class RefreshButton extends StatelessWidget {
  const RefreshButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GameControllerImp>(
        init: GameControllerImp(),
        builder: (controller) {
          return ElevatedButton(
            onPressed: () => controller.restartGame(),
            style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
              backgroundColor: Colors.blueGrey.withOpacity(0.8),
              padding: const EdgeInsets.all(10),
              elevation: 0.0,
            ),
            child: const Icon(
              Icons.refresh,
              size: 42.0,
              color: Colors.white,
            ),
          );
        });
  }
}
