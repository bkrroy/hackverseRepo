import 'package:chaosgames/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:chaosgames/authentication_services.dart';
import 'package:provider/provider.dart';

class GamePage extends StatefulWidget {
  static const String id = 'game_screen';

  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Center(
        child: FlatButton(
          height: 30,
          minWidth: 40,
          color: Colors.red,
          child: Text('Sign Out'),
          onPressed: () {
            context.read<AuthenticationService>().signOut();
            Navigator.pushNamed(context, WelcomeScreen.id);
          },
        ),
      ),
    );
  }
}
