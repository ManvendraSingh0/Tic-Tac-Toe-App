import 'package:get_it/get_it.dart';
import 'package:manvendrattt/services/board.dart';
import 'package:manvendrattt/services/board2.dart';

final locator = new GetIt.asNewInstance();

void setupLocator() {
  locator.registerSingleton(BoardService());
}
void setupLocator2() {
  locator.registerSingleton(BoardService2());
}