import 'package:flutter/material.dart';
import 'package:chaosgames/screens/welcome_screen.dart';
import 'package:chaosgames/screens/login_page.dart';
import 'package:chaosgames/screens/register_page.dart';

void main() => runApp(ChaosGames());

class ChaosGames extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        LoginPage.id: (context) => LoginPage(),
        RegisterPage.id: (context) => RegisterPage(),
      },
    );
  }
}
