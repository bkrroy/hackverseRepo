import 'package:chaosgames/firestore_services.dart';
import 'package:chaosgames/screens/welcome_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:chaosgames/authentication_services.dart';
import 'package:provider/provider.dart';
import 'dart:math';
import 'package:sweetalert/sweetalert.dart';
import 'package:chaosgames/screens/mainGameScreen.dart';
import '../authentication_services.dart';
import 'homePage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class GamePage extends StatefulWidget {
  static const String id = 'game_screen';

  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  String numberOfPlayers = 'One';
  String roundsValue = 'One';
  String time = '30sec';

  bool onClick = true;
  int gameCode = 1;

  void changeNumber() {
    setState(() {
      gameCode = Random().nextInt(10000) + 1;
    });
  }

   createButton() async{
    changeNumber();

    Provider.of<FirestoreService>(context, listen: false).createrJoinCode(
      gameCode: gameCode.toString(),
      playerCount: numberOfPlayers,
      roundCount: roundsValue,
      time: time,
    );

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
                      value: numberOfPlayers,
                      icon: Icon(
                        Icons.keyboard_arrow_down_outlined,
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
                          numberOfPlayers = newValue;
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
                        Icons.keyboard_arrow_down_outlined,
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
                        Icons.keyboard_arrow_down_outlined,
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
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // This is for sign out
                  FlatButton(
                    color: Color(0xFFFF5252),
                    child: Text(
                      'Sign Out',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      context.read<AuthenticationService>().signOut();
                      Navigator.pushNamed(context, WelcomeScreen.id);
                    },
                  ),
                  // This one is to go to home page
                  FlatButton(
                    color: Color(0xFFFF5252),
                    child: Text(
                      'Home',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      context.read<AuthenticationService>().signOut();
                      Navigator.pushNamed(context, HomePage.id);
                    },
                  ),
                  // This is to create a game
                  FlatButton(
                    color: Color(0xFFFF5252),
                    child: Text(
                      'Create',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                    onPressed: createButton,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
