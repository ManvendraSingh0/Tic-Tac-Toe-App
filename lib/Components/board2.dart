import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rxdart/rxdart.dart';
import 'package:manvendrattt/Constants//X.dart';
import 'package:manvendrattt/services/board2.dart';
import 'package:manvendrattt/services/provider.dart';
import 'package:manvendrattt/theme/theme.dart';
import 'package:manvendrattt/Constants/o.dart';


class Board2 extends StatefulWidget {
  Board2({Key key}) : super(key: key);

  _Board2State createState() => _Board2State();
}

class _Board2State extends State<Board2> {
  final boardService = locator<BoardService2>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<
        MapEntry<List<List<String>>, MapEntry<BoardState, String>>>(
        stream: Observable.combineLatest2(boardService.board$,
            boardService.boardState$, (a, b) => MapEntry(a, b)),
        builder: (context,
            AsyncSnapshot<
                MapEntry<List<List<String>>, MapEntry<BoardState, String>>>
            snapshot) {
          if (!snapshot.hasData) {
            return Container();
          }

          final List<List<String>> board = snapshot.data.key;
          final MapEntry<BoardState, String> state = snapshot.data.value;

          if (state.key == BoardState.Done) {
            boardService.resetBoard();

            String title = 'Winner';

            if (state.value == null) {
              title = "Draw";
            }

            Widget body = state.value == 'X'
                ? X(50, 20)
                : (state.value == "O"
                ? O(MyTheme.green, 50)
                : Row(
              children: <Widget>[X(20, 50), O(MyTheme.green, 50)],
            ));

          }

          return Container(
            padding: EdgeInsets.all(30),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  blurRadius: 7.0,
                  spreadRadius: 0.0,
                  color: Color(0x1F000000),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: board
                  .asMap()
                  .map(
                    (i, row) => MapEntry(
                  i,
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: row
                        .asMap()
                        .map(
                          (j, item) => MapEntry(
                        j,
                        GestureDetector(
                          onTap: () {
                            if (board[i][j] != ' ') return;
                            boardService.newMove(i, j);
                          },
                          child: _buildBox(i, j, item),
                        ),
                      ),
                    )
                        .values
                        .toList(),
                  ),
                ),
              )
                  .values
                  .toList(),
            ),
          );
        });
  }

  Widget _buildBox(int i, int j, item) {
    BoxBorder border = Border();
    BorderSide borderStyle = BorderSide(width: 1, color: Colors.black26);
    double height=80;
    double width=60;
    if (j == 1) {
      border = Border(right: borderStyle, left: borderStyle);
      height = width = 80;
    }
    if (i == 1) {
      border = Border(top: borderStyle, bottom: borderStyle);
    }
    if (i == 1 && j == 1) {
      border = Border(
          top: borderStyle,
          bottom: borderStyle,
          left: borderStyle,
          right: borderStyle);
    }
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: border,
      ),
      height: height,
      width: width,
      child: Center(
        child:
        item == ' ' ? null : item == 'X' ? X(13, 50) : O(MyTheme.green, 50),
      ),
    );
  }
}