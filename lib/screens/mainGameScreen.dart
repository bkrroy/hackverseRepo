import 'package:flutter/material.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';

class GameScreen extends StatefulWidget {
  static const String id = 'gameScreen_screen';

  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('ChaosGames'),
          backgroundColor: Color(0xFF253A4B),
        ),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                SizedBox(
                  height: 100.0,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FlatButton(
                      color: Colors.orange,
                      child: Text('Lorem Ipsum'),
                      onPressed: () {},
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FlatButton(
                      color: Colors.green,
                      child: Text('Lorem Ipsum'),
                      onPressed: () {},
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FlatButton(
                      color: Colors.blue,
                      child: Text('Lorem Ipsum'),
                      onPressed: () {},
                    ),
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircularCountDownTimer(
                  duration: 10,
                  initialDuration: 0,
                  controller: CountDownController(),
                  width: MediaQuery.of(context).size.width / 4,
                  height: MediaQuery.of(context).size.height / 6,
                  ringColor: Colors.grey[300],
                  ringGradient: null,
                  fillColor: Colors.purpleAccent[100],
                  fillGradient: null,
                  backgroundColor: Colors.purple[500],
                  backgroundGradient: null,
                  strokeWidth: 20.0,
                  strokeCap: StrokeCap.round,
                  textStyle: TextStyle(
                      fontSize: 33.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                  textFormat: CountdownTextFormat.S,
                  isReverse: false,
                  isReverseAnimation: false,
                  isTimerTextShown: true,
                  autoStart: false,
                  onStart: () {
                    print('Countdown Started');
                  },
                  onComplete: () {
                    print('Countdown Ended');
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
