import 'package:flutter/material.dart';
import 'package:genius_tic_tac_toe/contants/colors.dart';

class MainRoundedButton extends StatelessWidget {
  final String text;
  final Color color;
  final double round;
  final Border? border;
  final double textSize;
  final bool isActive;
  final TextStyle textStyle;
  final double padding;
  final double paddingVert;
  final VoidCallback callback;
  final LinearGradient? gradient;

  MainRoundedButton(
      {required this.text,
      this.color = mainColor,
      required this.callback,
      this.round = 6,
      this.isActive = true,
      this.textSize = 15,
      this.padding = 5,
      this.paddingVert = 10,
      this.border,
      this.gradient = mainGradient,
      this.textStyle = const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
          fontSize: 15,
          fontFamily: 'Muli')});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(round)),
      child: Material(
        color: color,
        child: InkWell(
          onTap: callback,
          hoverColor: color,
          focusColor: color,
          highlightColor: color,
          child: Container(
            decoration: BoxDecoration(
              border: border,
              gradient: gradient,
              borderRadius: BorderRadius.all(Radius.circular(round)),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: padding, vertical: paddingVert),
              child: Center(
                child: Text(
                  text,
                  style: textStyle,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
