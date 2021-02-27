import 'package:chaosgames/screens/mainGameScreen.dart';
import 'package:chaosgames/screens/player_page.dart';
import 'package:flutter/material.dart';
import 'package:chaosgames/authentication_services.dart';
import 'package:provider/provider.dart';
import 'package:chaosgames/constants.dart';
import 'package:chaosgames/component/rouded_button.dart';

class GameJoin extends StatefulWidget {
  static const String id = 'gamejoin_screen';

  @override
  _GameJoinState createState() => _GameJoinState();
}

class _GameJoinState extends State<GameJoin> {
  String code;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ChaosGames'),
        backgroundColor: Color(0xFF253A4B),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              textAlign: TextAlign.left,
              onChanged: (String value) {
                code = value;
              },
              decoration: kTextFieldDecoration.copyWith(hintText: 'Enter Code'),
            ),
            RoundedButton(
              title: 'Proceed',
              colour: Color(0xFFFF5252),
              onPressed: () {
                Navigator.pushNamed(context, GameScreen.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}
