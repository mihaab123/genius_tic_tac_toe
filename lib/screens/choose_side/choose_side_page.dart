import 'package:flutter/material.dart';
import 'package:genius_tic_tac_toe/contants/colors.dart';
import 'package:genius_tic_tac_toe/controllers/board_controller.dart';
import 'package:genius_tic_tac_toe/screens/two_players/two_players_page.dart';
import 'package:genius_tic_tac_toe/widgets/main_button.dart';
import 'package:genius_tic_tac_toe/widgets/player_side.dart';
import 'package:get/get.dart';

class ChooseSidePage extends StatefulWidget {
  final int type;
  const ChooseSidePage({Key? key, required this.type}) : super(key: key);

  @override
  State<ChooseSidePage> createState() => _ChooseSidePageState();
}

class _ChooseSidePageState extends State<ChooseSidePage> {
  int chooseSide = 1;
  final BoardController _boardController = Get.find<BoardController>();
  setChooseSide(int value) {
    setState(() {
      chooseSide = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(color: shadowColorAccent),
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              const Text(
                "Choose First Player Side",
                style: TextStyle(
                    color: whiteColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 30,
                    fontFamily: 'Muli'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      GestureDetector(
                        onTap: () => setChooseSide(1),
                        child: PlayerSide(size: 100, type: 1),
                      ),
                      Radio(
                        onChanged: (e) => setChooseSide(1),
                        activeColor: mainColor,
                        value: 1,
                        groupValue: chooseSide,
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      GestureDetector(
                        onTap: () => setChooseSide(2),
                        child: PlayerSide(size: 100, type: 2),
                      ),
                      Radio(
                        onChanged: (e) => setChooseSide(2),
                        activeColor: mainColor,
                        value: 2,
                        groupValue: chooseSide,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                width: Get.width * 0.8,
                child: MainRoundedButton(
                  callback: () {
                    _boardController.setPlayersSide(
                        chooseSide, chooseSide == 1 ? 2 : 1);
                    if (widget.type == 0)
                      Get.off(TwoPlayersPage());
                    else
                      Get.off(TwoPlayersPage());
                  },
                  text: "continue".toUpperCase(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
