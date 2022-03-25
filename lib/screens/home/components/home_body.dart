import 'package:flutter/material.dart';
import 'package:genius_tic_tac_toe/contants/colors.dart';
import 'package:genius_tic_tac_toe/screens/choose_side/choose_side_page.dart';
import 'package:genius_tic_tac_toe/widgets/main_button.dart';
import 'package:get/get.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(color: shadowColorAccent),
      child: Column(
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              MainRoundedButton(
                callback: () {},
                color: Colors.white,
                text: "single player".toUpperCase(),
              ),
              const SizedBox(width: 30),
              MainRoundedButton(
                  callback: () {
                    Get.off(const ChooseSidePage());
                  },
                  color: Colors.white,
                  text: "with a friend".toUpperCase()),
            ],
          ),
        ],
      ),
    );
  }
}
