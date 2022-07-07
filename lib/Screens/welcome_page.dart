import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manvendrattt/Screens/single_player.dart';
import 'package:manvendrattt/theme/theme.dart';
import 'package:manvendrattt/Constants/const.dart';
import 'package:manvendrattt/Components/logo.dart';

import 'multi_player.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = 'welcome_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.1, 0.65],
            colors: [
              MyTheme.orange,
              MyTheme.red,
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SafeArea(
              child: Center(
                child: Text(
                  'Tic Tac',
                  style: kTextStyle,
                ),
              ),
            ),
            Center(child: Logo()),
            SizedBox(
              height: 150.0,
            ),
            RoundBtn(
              colour: Colors.white,
              title: "SINGLE PLAYER",
              onPressed: () {
                Navigator.pushNamed(context, SinglePlayer.id);
              },
            ),
            SizedBox(
              height: 20.0,
            ),
            RoundBtn(
              colour: Colors.white,
              title: "MULTIPLAYER",
              onPressed: () {
                Navigator.pushNamed(context, MultiPlayer.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}