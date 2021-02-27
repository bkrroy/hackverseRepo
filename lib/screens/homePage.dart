import 'package:chaosgames/authentication_services.dart';
import 'package:chaosgames/screens/gameJoin.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:chaosgames/screens/gamePage.dart';
import 'package:sweetalert/sweetalert.dart';
import 'dart:math';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool onClick = true;
  int gameCode = 1;

  void changeNumber() {
    setState(() {
      gameCode = Random().nextInt(10000) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('ChaosGames'),
          backgroundColor: Color(0xFF253A4B),
        ),
        backgroundColor: Color(0xFF253A4B),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: FlatButton(
                  color: Color(0xFFFF5252),
                  child: Text(
                    'Create Game',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 50.0,
                    ),
                  ),
                  onPressed: () {
                    changeNumber();
                    SweetAlert.show(
                      context,
                      title: "Game Join Code",
                      subtitle: "$gameCode",
                      onPress: (bool onClick) {
                        if (onClick) {
                          Navigator.pushNamed(context, GamePage.id);
                        }
                        return false;
                      },
                    );
                    //Navigator.pushNamed(context, GamePage.id);
                  },
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: FlatButton(
                  color: Color(0xFFFF5252),
                  child: Text(
                    'Join Game',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 50.0,
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, GameJoin.id);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
