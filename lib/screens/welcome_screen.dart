import 'package:flutter/material.dart';
import 'package:chaosgames/screens/login_page.dart';
import 'package:chaosgames/screens/register_page.dart';
import 'package:chaosgames/component/rouded_button.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
//import 'package:flash_chat/components/rounded_button.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(duration: Duration(seconds: 1), vsync: this);
    animation =
        ColorTween(begin: Colors.white, end: Colors.white).animate(controller);
    controller.forward();
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: animation.value,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            new Image.asset('images/background.png'),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Row(
                children: <Widget>[
                  TypewriterAnimatedTextKit(
                    text: ['Chaos Games'],
                    textStyle: TextStyle(
                      fontSize: 45.0,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 32.5,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: RoundedButton(
                title: 'Log In',
                colour: Colors.red[400],
                onPressed: () {
                  Navigator.pushNamed(context, LoginPage.id);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: RoundedButton(
                title: 'Register',
                colour: Colors.red[400],
                onPressed: () {
                  Navigator.pushNamed(context, RegisterPage.id);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
