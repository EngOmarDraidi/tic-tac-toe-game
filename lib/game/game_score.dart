import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/game_controller.dart';
import '../widgets/o_widget.dart';
import '../widgets/x_widget.dart';

class GameScore extends StatelessWidget {
  const GameScore({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            const SizedBox(
              height: 30,
              width: 30,
              child: XWidget(),
            ),
            const SizedBox(
              height: 8,
            ),
            GetBuilder<GameControllerImp>(
              init: GameControllerImp(),
              builder: (controller) {
                return Text(
                  '${controller.winners['x']} Wins',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                );
              },
            ),
          ],
        ),
        Column(
          children: [
            const SizedBox(
              height: 30,
              width: 30,
              child: OWidget(),
            ),
            const SizedBox(
              height: 8,
            ),
            GetBuilder<GameControllerImp>(
              init: GameControllerImp(),
              builder: (controller) {
                return Text(
                  '${controller.winners['o']} Wins',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                );
              },
            ),
          ],
        ),
        Column(
          children: [
            const Icon(
              Icons.balance,
              size: 34,
              color: Colors.black45,
            ),
            const SizedBox(
              height: 8,
            ),
            GetBuilder<GameControllerImp>(
              init: GameControllerImp(),
              builder: (controller) {
                return Text(
                  '${controller.winners['tie']} Draws',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                );
              },
            ),
          ],
        ),
      ],
    );
  }
}
