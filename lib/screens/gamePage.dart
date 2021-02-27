import 'package:chaosgames/screens/player_page.dart';
import 'package:chaosgames/screens/welcome_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:chaosgames/authentication_services.dart';
import 'package:provider/provider.dart';
import 'dart:math';
import 'package:sweetalert/sweetalert.dart';
import 'package:chaosgames/screens/mainGameScreen.dart';

class GamePage extends StatefulWidget {
  static const String id = 'game_screen';

  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  String dropdownValue = 'One';
  String roundsValue = 'One';
  String time = '30sec';

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
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('ChaosGames'),
          backgroundColor: Color(0xFF253A4B),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  FlatButton(
                    color: Colors.white,
                    child: Text(
                      'No of players',
                      style: TextStyle(
                        color: Color(0xFF253A4B),
                        fontSize: 30.0,
                      ),
                    ),
                    onPressed: () {},
                  ),
                  Center(
                    child: DropdownButton<String>(
                      value: dropdownValue,
                      icon: Icon(
                        Icons.arrow_downward,
                        color: Color(0xFFFF5252),
                      ),
                      iconSize: 24,
                      elevation: 16,
                      style: TextStyle(
                        color: Color(0xFF253A4B),
                        fontSize: 25.0,
                      ),
                      underline: Container(
                        height: 2,
                        color: Color(0xFFFF5252),
                      ),
                      onChanged: (String newValue) {
                        setState(() {
                          dropdownValue = newValue;
                        });
                      },
                      items: <String>['One', 'Two', 'Free', 'Four']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  FlatButton(
                    color: Colors.white,
                    child: Text(
                      'No of Rounds',
                      style: TextStyle(
                        color: Color(0xFF253A4B),
                        fontSize: 30.0,
                      ),
                    ),
                    onPressed: () {
                      //The user picked true.
                    },
                  ),
                  Center(
                    child: DropdownButton<String>(
                      value: roundsValue,
                      icon: Icon(
                        Icons.arrow_downward,
                        color: Color(0xFFFF5252),
                      ),
                      iconSize: 24,
                      elevation: 16,
                      style: TextStyle(
                        color: Color(0xFF253A4B),
                        fontSize: 25.0,
                      ),
                      underline: Container(
                        height: 2,
                        color: Color(0xFFFF5252),
                      ),
                      onChanged: (String newValue) {
                        setState(() {
                          roundsValue = newValue;
                        });
                      },
                      items: <String>['One', 'Two', 'Three', 'Four']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  FlatButton(
                    color: Colors.white,
                    child: Text(
                      'Timer',
                      style: TextStyle(
                        color: Color(0xFF253A4B),
                        fontSize: 30.0,
                      ),
                    ),
                    onPressed: () {
                      //The user picked true.
                    },
                  ),
                  Center(
                    child: DropdownButton<String>(
                      value: time,
                      icon: Icon(
                        Icons.arrow_downward,
                        color: Color(0xFFFF5252),
                      ),
                      iconSize: 24,
                      elevation: 16,
                      style: TextStyle(
                        color: Color(0xFF253A4B),
                        fontSize: 25.0,
                      ),
                      underline: Container(
                        height: 2,
                        color: Color(0xFFFF5252),
                      ),
                      onChanged: (String newValue) {
                        setState(() {
                          time = newValue;
                        });
                      },
                      items: <String>['30sec', '45sec', '60sec']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.all(15.0),
                  child: FlatButton(
                    color: Color(0xFFFF5252),
                    child: Text(
                      'Create',
                      style: TextStyle(
                        fontSize: 25.0,
                        color: Colors.white,
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
                            Navigator.pushNamed(context, GameScreen.id);
                          }
                          return false;
                        },
                      );
                      //Navigator.pushNamed(context, GamePage.id);
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
