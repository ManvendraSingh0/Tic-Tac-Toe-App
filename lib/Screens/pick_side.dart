import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manvendrattt/Components/RoundedBtn.dart';
import 'package:manvendrattt/Constants/o.dart';
import 'package:manvendrattt/Constants/x.dart';
import 'package:manvendrattt/services/board.dart';
import 'package:manvendrattt/services/provider.dart';
import 'package:manvendrattt/Screens/single_player.dart';
import 'package:manvendrattt/theme/theme.dart';

class PickSide extends StatefulWidget {
  static String id = 'pick_side';
  @override
  _PickSideState createState() => _PickSideState();
}

class _PickSideState extends State<PickSide> {

  final boardService = locator<BoardService>();

  String groupValue = 'X';

  void setGroupvalue(value) {
    setState(() {
      groupValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children:<Widget> [
              Text(
                'Pick Your Side',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  // fontFamily: 'DancingScript',
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children:<Widget> [
                  Column(
                    children:<Widget> [
                      GestureDetector(
                        onTap: () => setGroupvalue('X'),
                        child: X(35, 150),
                      ),
                      Radio(
                        onChanged: (e) => setGroupvalue(e),
                        activeColor: Colors.orange,
                        value: 'X',
                        groupValue: groupValue,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "First",
                          style: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.w700,
                              fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children:<Widget> [
                      GestureDetector(
                        onTap: () => setGroupvalue('X'),
                        child: O(Colors.green, 150),
                      ),
                      Radio(
                        onChanged: (e) => setGroupvalue(e),
                        activeColor: Colors.orange,
                        hoverColor: Colors.black,
                        value: 'O',
                        groupValue: groupValue,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Second",
                          style: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.w700,
                              fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                children:<Widget> [
                  Container(
                    child: CopBtn(
                      onTap: (){
                        boardService.resetBoard();
                        boardService.setStart(groupValue);

                        if (groupValue == 'O') {
                          boardService.player$.add("X");
                          // boardService.botMove();
                        }

                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => SinglePlayer(),
                          ),
                        );
                      },
                      height: 49,
                      width: 260,
                      borderRadius: 200,
                      gradient: [MyTheme.orange, MyTheme.red],
                      child: Text(
                        "continue".toUpperCase(),
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
