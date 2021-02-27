import 'package:flutter/material.dart';
import 'package:chaosgames/component/rouded_button.dart';
import 'package:chaosgames/constants.dart';

class RegisterPage extends StatefulWidget {
  static const String id = 'register_screen';

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String name;
  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ChaosGames'),
        backgroundColor: Color(0xFF253A4B),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Flexible(
              child: Hero(
                tag: 'logo',
                child: Container(
                  // height: 200.0,
                  child: Image.asset('images/logo.PNG'),
                ),
              ),
            ),
            SizedBox(
              height: 48.0,
            ),
            TextField(
              textAlign: TextAlign.left,
              onChanged: (value) {
                name = value;
              },
              decoration: kTextFieldDecoration.copyWith(hintText: 'Name'),
            ),
            SizedBox(
              height: 2.0,
            ),
            TextField(
              keyboardType: TextInputType.emailAddress,
              textAlign: TextAlign.left,
              onChanged: (value) {
                email = value;
              },
              decoration: kTextFieldDecoration.copyWith(hintText: 'Email'),
            ),
            SizedBox(
              height: 2.0,
            ),
            TextField(
              obscureText: true,
              textAlign: TextAlign.left,
              onChanged: (value) {
                password = value;
              },
              decoration: kTextFieldDecoration.copyWith(hintText: 'Password'),
            ),
            SizedBox(
              height: 24.0,
            ),
            RoundedButton(
              title: 'Register',
              colour: Color(0xFFFF5252),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
