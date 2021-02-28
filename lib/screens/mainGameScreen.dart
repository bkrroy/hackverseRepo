import 'package:chaosgames/firestore_services.dart';
import 'package:flutter/material.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:provider/provider.dart';

class GameScreen extends StatefulWidget {
  static const String id = 'gameScreen_screen';

  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {

  String _truth1;
  String _truth2;
  String _lie;

  InputDecoration _inputDecorationTruth = InputDecoration(
    hintText: 'Truth'
  );

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenwidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('ChaosGames'),
          backgroundColor: Color(0xFF253A4B),
        ),
        body: Container(
          height: screenHeight,
          width: screenwidth,
          child: Column(
            children: [
              Container(
                height: 60,
                width: screenwidth,
                child: Center(child: Text(Provider.of<FirestoreService>(context, listen: true).getCreatedCode())),
              ),
              TextField(
                onChanged: (String value){
                  _truth1 = value;
                },
                decoration: _inputDecorationTruth
              ),
              TextField(
                  onChanged: (String value){
                    _truth2 = value;
                  },
                decoration: _inputDecorationTruth
              ),
              TextField(
                onChanged: (String value){
                  _lie = value;
                },
                decoration: InputDecoration(
                  hintText: 'Lie'
                ),
              ),
              FlatButton(
                child: Text('Click Me'),
                onPressed: (){
                  Provider.of<FirestoreService>(context, listen: false).truthAndLieData(
                    truth1: _truth1,
                    truth2: _truth2,
                    lie: _lie,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
