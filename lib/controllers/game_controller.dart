import 'package:get/get.dart';
import '../minimax_algorithm/minimax_algorithm.dart';

abstract class GameController extends GetxController {}

class GameControllerImp extends GameController {
  bool isHumen = true;
  bool finishGame = false;
  String? lineType;
  String? fWinner;
  String currentPlayer = 'Your';

  Map<String, int> winners = {
    'x': 0,
    'o': 0,
    'tie': 0,
  };

  List<List<String>> board = [
    ['', '', ''],
    ['', '', ''],
    ['', '', ''],
  ];

  void restartGame() {
    fWinner = null;
    isHumen = true;
    finishGame = false;
    lineType = null;
    currentPlayer = 'Your';
    board = [
      ['', '', ''],
      ['', '', ''],
      ['', '', '']
    ];
    update();
  }

  void selectPosition(index) async {
    int i = (index ~/ 3);
    int j = index % 3;
    if (board[i][j] == '' && isHumen && !finishGame) {
      board[i][j] = 'x';
      isHumen = false;
      currentPlayer = 'AI';
      update();
      await Future.delayed(const Duration(milliseconds: 300));
      List<int> bestMove = selectBestMove(board);
      if (bestMove.isNotEmpty) {
        board[bestMove[0]][bestMove[1]] = 'o';
      }
      isHumen = true;
      List<String?> result = checkWinner(board);
      if (result[0] != null) {
        fWinner = result[0];
        lineType = result[1];
        winners[fWinner!] = winners[fWinner]! + 1;
        finishGame = true;
      } else {
        currentPlayer = 'Your';
      }
      update();
    }
  }
}
