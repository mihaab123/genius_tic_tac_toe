import 'package:flutter/material.dart';
import 'package:genius_tic_tac_toe/contants/colors.dart';

class PlayerSide extends StatelessWidget {
  final Widget icon;
  double size;
  int type;
  PlayerSide({
    Key? key,
    required this.size,
    required this.type,
  })  : icon = Icon(
          type == 1 ? Icons.close_outlined : Icons.radio_button_off,
          color: whiteColor,
          size: size,
        ),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
      width: size,
      child: icon,
    );
  }
}
