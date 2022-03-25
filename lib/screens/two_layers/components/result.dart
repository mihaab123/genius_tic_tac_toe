import 'package:flutter/material.dart';
import 'package:genius_tic_tac_toe/contants/colors.dart';
import 'package:genius_tic_tac_toe/contants/conts.dart';
import 'package:genius_tic_tac_toe/controllers/board_controller.dart';
import 'package:genius_tic_tac_toe/screens/home/home_page.dart';
import 'package:genius_tic_tac_toe/widgets/main_button.dart';
import 'package:get/get.dart';

class Result extends StatelessWidget {
  final BoardController _boardController = Get.find<BoardController>();
  Result({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      String result = "";
      if (_boardController.currentState == DRAW) result = "Game is over";
      if (_boardController.currentState == FIRST_WIN)
        result = "First Player Win";
      if (_boardController.currentState == SECOND_WIN)
        result = "Second Player Win";
      return Column(
        children: [
          Text(result,
              style: const TextStyle(
                  fontSize: 25,
                  color: whiteColor,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Muli')),
          result.isNotEmpty
              ? SizedBox(
                  width: Get.width * 0.8,
                  child: MainRoundedButton(
                    callback: () async {
                      await _boardController.initialLoad();
                      Get.off(const HomePage());
                    },
                    text: "continue".toUpperCase(),
                  ),
                )
              : Container(),
        ],
      );
    });
  }
}
