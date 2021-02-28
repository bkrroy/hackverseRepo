import 'package:chaosgames/firestore_services.dart';
import 'package:chaosgames/screens/gameJoin.dart';
import 'package:chaosgames/screens/gamePage.dart';
import 'package:chaosgames/screens/joined_Screen.dart';
import 'package:chaosgames/screens/player_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:chaosgames/screens/welcome_screen.dart';
import 'package:chaosgames/screens/login_page.dart';
import 'package:chaosgames/screens/register_page.dart';
import 'package:provider/provider.dart';
import 'package:chaosgames/authentication_services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:chaosgames/screens/mainGameScreen.dart';

import 'screens/homePage.dart';
import 'screens/homePage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ChaosGames());
}

class ChaosGames extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthenticationService>(
          create: (_) => AuthenticationService(FirebaseAuth.instance),
        ),
        StreamProvider(
          create: (context) =>
              context.read<AuthenticationService>().authStateChanges,
        ),
        ChangeNotifierProvider<FirestoreService>(
          create: (_) => FirestoreService(FirebaseFirestore.instance),
        ),
      ],
      child: MaterialApp(
        initialRoute: WelcomeScreen.id,
        routes: {
          WelcomeScreen.id: (context) => WelcomeScreen(),
          LoginPage.id: (context) => LoginPage(),
          RegisterPage.id: (context) => RegisterPage(),
          GamePage.id: (context) => GamePage(),
          GameJoin.id: (context) => GameJoin(),
          PlayerPage.id: (context) => PlayerPage(),
          GameScreen.id: (context) => GameScreen(),
          HomePage.id : (context) => HomePage(),
          JoinedScreen.id: (context) => JoinedScreen(),
        },
      ),
    );
  }
}
