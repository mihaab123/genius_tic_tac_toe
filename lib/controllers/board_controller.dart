import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BoardController extends GetxController {
  RxList<int> currentBoard = RxList<int>([]);
  RxInt firstPlayer = RxInt(0);
  RxInt secondPlayer = RxInt(0);
  RxInt currentPlayer = RxInt(0);

  @override
  void onInit() {
    super.onInit();
    initialLoad();
  }

  initialLoad() async {
    currentBoard.value = List.generate(9, (index) => 0);
  }

  setPlayersSide(int firstPlayer, int secondPlayer) {
    this.firstPlayer.value = firstPlayer;
    this.secondPlayer.value = secondPlayer;
  }

  setFieldValue(int index) {
    debugPrint("currentPlayer ${currentPlayer}");
    currentBoard[index] = currentPlayer.value + 1;
  }
}
