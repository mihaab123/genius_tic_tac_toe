import 'package:flutter/material.dart';
import 'package:genius_tic_tac_toe/contants/colors.dart';
import 'package:genius_tic_tac_toe/controllers/board_controller.dart';
import 'package:genius_tic_tac_toe/widgets/player_side.dart';
import 'package:get/get.dart';

class Field extends StatelessWidget {
  final BoardController _boardController = Get.find<BoardController>();
  final int index;
  final VoidCallback callback;

  final BorderSide _borderSide =
      const BorderSide(color: mainColor, width: 2.0, style: BorderStyle.solid);
  Field({Key? key, required this.index, required this.callback})
      : super(key: key);

  Border _determineBorder() {
    Border determinedBorder = Border.all();

    switch (index) {
      case 0:
        determinedBorder = Border(bottom: _borderSide, right: _borderSide);
        break;
      case 1:
        determinedBorder =
            Border(left: _borderSide, bottom: _borderSide, right: _borderSide);
        break;
      case 2:
        determinedBorder = Border(left: _borderSide, bottom: _borderSide);
        break;
      case 3:
        determinedBorder =
            Border(bottom: _borderSide, right: _borderSide, top: _borderSide);
        break;
      case 4:
        determinedBorder = Border(
            left: _borderSide,
            bottom: _borderSide,
            right: _borderSide,
            top: _borderSide);
        break;
      case 5:
        determinedBorder =
            Border(left: _borderSide, bottom: _borderSide, top: _borderSide);
        break;
      case 6:
        determinedBorder = Border(right: _borderSide, top: _borderSide);
        break;
      case 7:
        determinedBorder =
            Border(left: _borderSide, top: _borderSide, right: _borderSide);
        break;
      case 8:
        determinedBorder = Border(left: _borderSide, top: _borderSide);
        break;
    }

    return determinedBorder;
  }

  Widget getCurrentField(int index) {
    Widget _widget = const SizedBox(
      height: 80,
      width: 80,
    );
    switch (_boardController.currentBoard[index]) {
      case 1:
        _widget = PlayerSide(
          size: 80,
          type: 1,
          color: mainColor,
        );
        break;
      case 2:
        _widget = PlayerSide(size: 60, type: 2, color: mainColor);
        break;
    }
    return _widget;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: Container(
        margin: const EdgeInsets.all(0.0),
        decoration: BoxDecoration(border: _determineBorder()),
        child: Center(child: Obx(() {
          Widget _widget = getCurrentField(index);
          return _widget;
        })),
      ),
    );
  }
}
