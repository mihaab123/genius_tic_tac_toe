import 'package:genius_tic_tac_toe/models/board.dart';
import 'package:get/get.dart';

class BoardController extends GetxController {
  Rxn<BoardModel> currentBoard = Rxn();
  RxInt firstPlayer = RxInt(0);
  RxInt secondPlayer = RxInt(0);

  @override
  void onInit() {
    super.onInit();
    initialLoad();
  }

  initialLoad() async {
    currentBoard.value = List.generate(9, (index) => 0) as BoardModel;
  }

  setPlayersSide(int firstPlayer, int secondPlayer) {
    this.firstPlayer.value = firstPlayer;
    this.secondPlayer.value = secondPlayer;
  }
}
