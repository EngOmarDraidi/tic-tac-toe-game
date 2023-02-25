import 'dart:math';

const Map<String, int> boardScore = {
  'x': -10,
  'o': 10,
  'tie': 0,
};

List<int> selectBestMove(List<List<String>> board) {
  int bestScore = -1000;
  List<int> move = [];

  for (int i = 0; i < 3; i++) {
    for (int j = 0; j < 3; j++) {
      if (board[i][j] == '') {
        board[i][j] = 'o';
        final int score = callMinimax(board, 0, false);
        board[i][j] = '';
        if (score > bestScore) {
          bestScore = score;
          move = [i, j];
        }
      }
    }
  }
  return move;
}

int callMinimax(List<List<String>> board, int depth, bool maximizer) {
  final String? result = checkWinner(board)[0];
  if (result != null) {
    return (boardScore[result] as int);
  }

  if (maximizer) {
    int bestScore = -1000;
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        if (board[i][j] == '') {
          board[i][j] = 'o';
          final int score = callMinimax(board, depth + 1, false);
          board[i][j] = '';
          bestScore = max(score, bestScore);
        }
      }
    }
    return bestScore;
  } else {
    int bestScore = 1000;
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        if (board[i][j] == '') {
          board[i][j] = 'x';
          final int score = callMinimax(board, depth + 1, true);
          board[i][j] = '';
          bestScore = min(score, bestScore);
        }
      }
    }
    return bestScore;
  }
}

List<String?> checkWinner(List<List<String>> board) {
  String? winner;
  String? line;

  // for horizontal
  for (int i = 0; i < 3; i++) {
    if (board[i][0] == board[i][1] &&
        board[i][1] == board[i][2] &&
        board[i][0] != '') {
      winner = board[i][0];
      line = 'h$i';
    }
  }

  // for vertical
  for (int i = 0; i < 3; i++) {
    if (board[0][i] == board[1][i] &&
        board[1][i] == board[2][i] &&
        board[0][i] != '') {
      winner = board[0][i];
      line = 'v$i';
    }
  }

  // for diagonal
  if (board[0][0] == board[1][1] &&
      board[1][1] == board[2][2] &&
      board[0][0] != '') {
    winner = board[0][0];
    line = 'd0';
  }

  if (board[2][0] == board[1][1] &&
      board[1][1] == board[0][2] &&
      board[2][0] != '') {
    winner = board[2][0];
    line = 'd1';
  }

  int spot = 0;

  for (int i = 0; i < 3; i++) {
    for (int j = 0; j < 3; j++) {
      if (board[i][j] == '') {
        spot++;
      }
    }
  }

  if (winner == null && spot == 0) {
    return ['tie', null];
  } else {
    return [winner, line];
  }
}
