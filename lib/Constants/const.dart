import 'package:flutter/material.dart';
import 'package:manvendrattt/Components/RoundedBtn.dart';

const kTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 65,
  fontWeight: FontWeight.w700,
  fontFamily: 'DancingScript',
);

class RoundBtn extends StatelessWidget {
  RoundBtn({this.colour, this.title, this.onPressed});

  final Color colour;
  final String title;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RoundedButton(
        colour: colour,
        title: title,
        onPressed: onPressed,
      ),
    );
  }
}

