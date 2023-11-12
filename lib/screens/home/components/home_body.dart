import 'package:flutter/material.dart';
import 'package:genius_tic_tac_toe/contants/colors.dart';
import 'package:genius_tic_tac_toe/controllers/board_controller.dart';
import 'package:genius_tic_tac_toe/screens/choose_side/choose_side_page.dart';
import 'package:genius_tic_tac_toe/widgets/main_button.dart';
import 'package:get/get.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final BoardController _boardController = Get.put(BoardController());
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(color: shadowColorAccent),
      child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          const Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Genius Tic Tac Toe",
                style: TextStyle(
                    color: whiteColor,
                    fontSize: 40,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Muli'),
              ),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Image(
                  image: AssetImage("assets/images/app_logo.png"),
                ),
              ),
            ],
          ),
          const Spacer(),
          SizedBox(
            width: Get.width * 0.4,
            child: MainRoundedButton(
                callback: () {
                  Get.off(const ChooseSidePage(
                    type: 0,
                  ));
                },
                color: whiteColor,
                text: "Play".toUpperCase()),
          ),
          const SizedBox(
            height: 30,
          )
        ],
      ),
    );
  }
}
