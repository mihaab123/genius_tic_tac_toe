import 'package:flutter/material.dart';
import 'package:genius_tic_tac_toe/contants/colors.dart';
import 'package:genius_tic_tac_toe/widgets/loop_animation.dart';

class PlayerSide extends StatelessWidget {
  final Widget icon;
  final Color color;
  double size;
  int type;
  PlayerSide({
    Key? key,
    required this.size,
    this.color = whiteColor,
    required this.type,
  })  : icon = Icon(
          type == 1 ? Icons.close_outlined : Icons.radio_button_off,
          color: color,
          size: size,
        ),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyAnimation(
      SizedBox(
        height: size,
        width: size,
        child: icon,
      ),
    );
  }
}
