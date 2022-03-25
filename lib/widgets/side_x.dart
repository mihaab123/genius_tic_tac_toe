import 'package:flutter/material.dart';
import 'package:genius_tic_tac_toe/contants/colors.dart';

class SideX extends StatelessWidget {
  double size;
  SideX({
    Key? key,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      child: Icon(
        Icons.close_outlined,
        color: whiteColor,
        size: size,
      ),
    );
  }
}
