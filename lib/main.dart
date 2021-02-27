import 'package:flutter/material.dart';

void main() => runApp(ChaosGames());

class ChaosGames extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(primaryColor: Color),
    );
  }
}
