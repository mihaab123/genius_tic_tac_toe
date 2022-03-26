import 'package:flutter/material.dart';
import 'package:genius_tic_tac_toe/contants/conts.dart';
import 'package:get/get.dart';

class BoardController extends GetxController {
  RxList<int> currentBoard = RxList<int>([]);
  RxInt firstPlayer = RxInt(0);
  RxInt secondPlayer = RxInt(0);
  RxInt currentPlayer = RxInt(0);
  RxInt currentState = RxInt(0);

  @override
  void onInit() {
    super.onInit();
    initialLoad();
  }

  initialLoad() async {
    currentBoard.value = List.generate(9, (index) => 0);
    currentState.value = 0;
  }

  setPlayersSide(int firstPlayer, int secondPlayer) async {
    this.firstPlayer.value = firstPlayer;
    this.secondPlayer.value = secondPlayer;
  }

  setFieldValue(int index) async {
    currentBoard[index] = currentPlayer.value + 1;
    await evaluateBoard(currentPlayer.value);
    currentPlayer.value = currentPlayer.value == 0 ? 1 : 0;
  }

  Future<bool> isBoardFull() async {
    for (int val in currentBoard) {
      if (val == EMPTY_SPACE) return false;
    }

    return true;
  }

  Future<bool> isMoveLegal(int move) async {
    if (move < 0 ||
        move >= currentBoard.length ||
        currentBoard[move] != EMPTY_SPACE) return false;

    return true;
  }

  evaluateBoard(int currentPlayer) async {
    for (var list in WIN_CONDITIONS_LIST) {
      if (currentBoard[list[0]] !=
              EMPTY_SPACE && // if a player has played here AND
          currentBoard[list[0]] ==
              currentBoard[
                  list[1]] && // if all three positions are of the same player
          currentBoard[list[0]] == currentBoard[list[2]]) {
        debugPrint("currentPlayer = $currentPlayer");
        currentState.value = (currentPlayer == 0 ? FIRST_WIN : SECOND_WIN);
      }
    }
    if (currentState.value == 0) {
      if (await isBoardFull()) {
        currentState.value = DRAW;
      } else {
        currentState.value = NO_WINNERS_YET;
      }
      debugPrint("currentState =$currentState");
    }
  }
}
