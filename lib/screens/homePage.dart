import 'package:chaosgames/authentication_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue,
        child: Center(
          child: FlatButton(
            height: 30,
            minWidth: 40,
            color: Colors.red,
            child: Text('Sign Out'),
            onPressed: (){
              context.read<AuthenticationService>().signOut();
            },
          )
        ),
      ),
    );
  }
}
