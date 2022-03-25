import 'package:flutter/material.dart';
import 'package:genius_tic_tac_toe/contants/colors.dart';
import 'package:genius_tic_tac_toe/controllers/board_controller.dart';
import 'package:genius_tic_tac_toe/screens/two_players/components/field.dart';
import 'package:genius_tic_tac_toe/screens/two_players/components/result.dart';
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
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(40),
                    child: Text(
                      "First are playing as \"$firstPlayer\", Second are playing as \"$secondPlayer\"",
                      style: const TextStyle(
                          fontSize: 25,
                          color: whiteColor,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Muli'),
                    ),
                  ),
                  Container(
                    height: 300,
                    width: 300,
                    padding: EdgeInsets.all(30),
                    decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                          blurRadius: 7.0,
                          spreadRadius: 0.0,
                          color: Color(0x1F000000),
                        ),
                      ],
                    ),
                    child: GridView.count(
                        crossAxisCount: 3,
                        children: List.generate(9, (index) {
                          return Field(
                            index: index,
                            callback: () async {
                              if (_boardController.currentState == 0 &&
                                  _boardController.currentBoard[index] == 0) {
                                await _boardController.setFieldValue(index);
                              }
                            },
                          );
                        })),
                  ),
                  Result(
                    type: 2,
                  ),
                ],
              );
            })),
      ),
    );
  }
}
