import 'package:flutter/material.dart';
import 'package:genius_tic_tac_toe/contants/colors.dart';

class SideO extends StatelessWidget {
  double size;
  SideO({
    Key? key,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      child: Icon(
        Icons.radio_button_off,
        color: whiteColor,
        size: size,
      ),
    );
  }
}
