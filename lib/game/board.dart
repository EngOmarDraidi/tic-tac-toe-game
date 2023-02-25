import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/game_controller.dart';
import '../widgets/x_widget.dart';
import '../widgets/o_widget.dart';
import '../widgets/win_lines.dart';

const double diagonal = 40;
const double horizontal = 30;
const double vertical = 30;

class Board extends StatelessWidget {
  const Board({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GameControllerImp>(
        init: GameControllerImp(),
        builder: (controller) {
          return Stack(
            children: [
              GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                padding: const EdgeInsets.all(20),
                shrinkWrap: true,
                itemCount: 9,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    controller.selectPosition(index);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(32),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: (index + 1) > 6
                            ? BorderSide.none
                            : const BorderSide(color: Colors.grey, width: 4),
                        right: (index + 1) % 3 == 0
                            ? BorderSide.none
                            : const BorderSide(color: Colors.grey, width: 4),
                      ),
                    ),
                    child: controller.board[(index ~/ 3)][index % 3] != ''
                        ? controller.board[(index ~/ 3)][index % 3] == 'x'
                            ? const XWidget()
                            : const OWidget()
                        : null,
                  ),
                ),
              ),
              if (controller.finishGame)
                SizedBox(
                  height: 430,
                  width: 430,
                  child: CustomPaint(
                    painter: WinLines(lineType: controller.lineType),
                    child: Container(),
                  ),
                ),
            ],
          );
        });
  }
}
