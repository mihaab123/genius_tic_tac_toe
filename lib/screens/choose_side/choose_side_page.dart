import 'package:flutter/material.dart';
import 'package:genius_tic_tac_toe/contants/colors.dart';
import 'package:genius_tic_tac_toe/screens/two_layers/two_players_page.dart';
import 'package:genius_tic_tac_toe/widgets/main_button.dart';
import 'package:genius_tic_tac_toe/widgets/side_o.dart';
import 'package:genius_tic_tac_toe/widgets/side_x.dart';
import 'package:get/get.dart';

class ChooseSidePage extends StatefulWidget {
  const ChooseSidePage({Key? key}) : super(key: key);

  @override
  State<ChooseSidePage> createState() => _ChooseSidePageState();
}

class _ChooseSidePageState extends State<ChooseSidePage> {
  int chooseSide = 1;
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
                        child: SideX(
                          size: 100,
                        ),
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
                        child: SideO(
                          size: 100,
                        ),
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
              MainRoundedButton(
                callback: () {
                  Get.off(const TwoPlayersPage());
                },
                text: "continue".toUpperCase(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
