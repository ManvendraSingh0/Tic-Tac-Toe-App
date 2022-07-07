import 'package:flutter/material.dart';

// ignore: must_be_immutable
class O extends StatelessWidget {

  O(this.color, this.size);

  Color color;
  double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size / 2),
        gradient: RadialGradient(
          radius: 0.22,
          colors: [
            Colors.transparent,
            color
          ],
          stops: [1, 1],
        ),
      ),
    );
  }
}
