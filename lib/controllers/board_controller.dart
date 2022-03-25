import 'package:genius_tic_tac_toe/models/board.dart';
import 'package:get/get.dart';

class BoardController extends GetxController {
  Rxn<BoardModel> currentBoard = Rxn();

  @override
  void onInit() {
    super.onInit();
    initialLoad();
  }

  initialLoad() async {
    currentBoard.value = List.generate(9, (index) => 0) as BoardModel;
  }
}
