import 'package:chaosgames/authentication_services.dart';
import 'package:chaosgames/screens/gameJoin.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:chaosgames/screens/gamePage.dart';

import '../authentication_services.dart';
import 'login_page.dart';
import 'welcome_screen.dart';

class HomePage extends StatefulWidget {
  static const String id = 'home_page';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
            SizedBox(
              height: 100.0,
            ),
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
                    Navigator.pushNamed(context, GamePage.id);
                  }, //Navigator.pushNamed(context, GamePage.id);
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
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: GestureDetector(
                child: Container(
                  height: 100,
                  color: Color(0xFFFF5252),
                  child: Center(
                    child: Text(
                      'Sign Out',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                onTap: (){
                  Provider.of<AuthenticationService>(context, listen: false).signOut();
                  Navigator.pushNamed(context, WelcomeScreen.id);
                },
              ),
            ),
            SizedBox(
              height: 100.0,
            ),
          ],
        ),
      ),
    );
  }
}
