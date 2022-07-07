import 'package:flutter/material.dart';

// ignore: must_be_immutable
class X extends StatelessWidget {

  X(this.height, this.size);

  double height;
  double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      child: Stack(
        children:<Widget> [
          Positioned(
            left: 0,
            top: size / 2 - height / 2,
            child: RotationTransition(
              turns: AlwaysStoppedAnimation(-45 / 360),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(200),
                  gradient: LinearGradient(
                    begin: Alignment.centerRight,
                    end: Alignment.centerLeft,
                    stops: [0.1, 0.8],
                    colors: [
                      Colors.orange,
                      Colors.red,
                    ],
                  ),
                ),
                height: height,
                width: size,
              ),
            ),
          ),
          Positioned(
            right: 0,
            top: size / 2 - height / 2,
            child: RotationTransition(
              turns: AlwaysStoppedAnimation(45 / 360),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(200),
                  gradient: LinearGradient(
                    begin: Alignment.centerRight,
                    end: Alignment.centerLeft,
                    stops: [0.1, 0.8],
                    colors: [
                      Colors.red,
                      Colors.orange,
                    ],
                  ),
                ),
                height: height,
                width: size,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
