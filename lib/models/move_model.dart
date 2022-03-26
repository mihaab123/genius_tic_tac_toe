import 'package:flutter/material.dart';
import 'package:genius_tic_tac_toe/contants/conts.dart';

class Move {
  int score;
  int move;

  Move({this.score = -1000, this.move = -1});

  int play(List<int> board, int currentPlayer) {
    debugPrint("currentPlayer = $currentPlayer");
    return _getBestMove(board, currentPlayer);
  }

  int _getBestMove(List<int> board, int currentPlayer) {
    List<int> newBoard;
    debugPrint("board.length = ${board.length}");
    for (int currentMove = 0; currentMove < board.length; currentMove++) {
      if (!isMoveLegal(board, currentMove)) continue;

      // we need a copy of the initial board so we don't pollute our real board
      newBoard = List.from(board);

      // make the move
      newBoard[currentMove] = currentPlayer;

      // solve for the next player
      // what is a good score for the opposite player is opposite of good score for us
      int nextScore = -_getBestScore(newBoard, flipPlayer(currentPlayer));

      // check if the current move is better than our best found move
      if (nextScore > score) {
        score = nextScore;
        move = currentMove;
      }
      debugPrint("score = $score, move = $move");
    }

    return move;
  }

  bool isMoveLegal(List<int> board, int move) {
    if (move < 0 || move >= board.length || board[move] != EMPTY_SPACE) {
      return false;
    }

    return true;
  }

  int flipPlayer(int currentPlayer) {
    return currentPlayer = currentPlayer == 0 ? 1 : 0;
  }

  int _getBestScore(List<int> board, int currentPlayer) {
    int evaluation = evaluateBoard(board, currentPlayer);

    if (evaluation == currentPlayer) return WIN_SCORE;

    if (evaluation == DRAW) return DRAW_SCORE;

    if (evaluation == flipPlayer(currentPlayer)) {
      return LOSE_SCORE;
    }
    return _getBestMove(board, currentPlayer);
  }

  int evaluateBoard(List<int> board, int currentPlayer) {
    for (var list in WIN_CONDITIONS_LIST) {
      if (board[list[0]] != EMPTY_SPACE && // if a player has played here AND
          board[list[0]] ==
              board[list[1]] && // if all three positions are of the same player
          board[list[0]] == board[list[2]]) {
        return (currentPlayer == 0 ? FIRST_WIN : SECOND_WIN);
      }
    }

    if (isBoardFull(board)) {
      return DRAW;
    }
    return NO_WINNERS_YET;
  }

  bool isBoardFull(List<int> board) {
    for (var val in board) {
      if (val == EMPTY_SPACE) return false;
    }

    return true;
  }
}
