import 'package:flutter/material.dart';
import 'package:genius_tic_tac_toe/contants/colors.dart';
import 'package:genius_tic_tac_toe/controllers/board_controller.dart';
import 'package:get/get.dart';

class TwoPlayerBody extends StatelessWidget {
  final BoardController _boardController = Get.find<BoardController>();
  TwoPlayerBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
            decoration: const BoxDecoration(color: shadowColorAccent),
            width: MediaQuery.of(context).size.width,
            child: Obx(() {
              String firstPlayer =
                  _boardController.firstPlayer.value == 1 ? "X" : "O";
              String secondPlayer =
                  _boardController.secondPlayer.value == 1 ? "X" : "O";
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(50),
                    child: Text(
                      "First are playing as \"$firstPlayer\", Second are playing as \"$secondPlayer\"",
                      style: const TextStyle(
                          fontSize: 25,
                          color: whiteColor,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Muli'),
                    ),
                  ),
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 3,
                    ),
                  ),
                ],
              );
            })),
      ),
    );
  }
}
