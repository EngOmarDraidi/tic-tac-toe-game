import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xo_game/widgets/x_widget.dart';
import '../controllers/game_controller.dart';
import '../widgets/o_widget.dart';

class CurrentPlayer extends StatelessWidget {
  const CurrentPlayer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GetBuilder<GameControllerImp>(
          builder: (controller) {
            return SizedBox(
              height: 30,
              width: 30,
              child: controller.currentPlayer == 'Your'
                  ? const XWidget()
                  : const OWidget(),
            );
          },
        ),
        const SizedBox(
          height: 10.0,
        ),
        GetBuilder<GameControllerImp>(
          builder: (controller) {
            return Text(
              "${controller.currentPlayer} move",
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w600,
              ),
            );
          },
        ),
      ],
    );
  }
}
