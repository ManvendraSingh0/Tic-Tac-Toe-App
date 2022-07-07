import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manvendrattt/Screens/multi_player.dart';
import 'package:manvendrattt/Screens/pick_side.dart';
import 'package:manvendrattt/services/provider.dart';
import 'Screens/single_player.dart';
import 'Screens/welcome_page.dart';

void main() {
  setupLocator();
  setupLocator2();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomePage());
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        textTheme: TextTheme(
          // ignore: deprecated_member_use
          bodyText1: TextStyle(color: Colors.black54),
        ),
      ),

      // Defining Routes In Main
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        SinglePlayer.id: (context) => PickSide(),
        SinglePlayer.id: (context) => SinglePlayer(),
        MultiPlayer.id: (context) => MultiPlayer(),
      },
    );
  }
}