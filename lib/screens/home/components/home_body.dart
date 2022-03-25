import 'package:flutter/material.dart';
import 'package:genius_tic_tac_toe/contants/colors.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        gradient: mainGradient,
      ),
      child: Column(
        children: [
          Flexible(
            flex: 1,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Genius Tic Tac Toe",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Muli'),
                ),
                //Image.asset("assets/images/app_logo.png"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
