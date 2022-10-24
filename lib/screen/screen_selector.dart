import 'package:flutter/material.dart';
import 'register_screen.dart';
import 'stream_test_screen.dart';
import 'view_screen.dart';

class ScreenSelector with ChangeNotifier {
  ScreenSelector();
  String _screenSelectString = '등록하기';

  void moveScreen(String select) {
    _screenSelectString = select;
    notifyListeners();
  }

  Widget getScreeen() {
    switch (_screenSelectString) {
      case '등록하기':
        return const RegisterScreen();
      case '살펴보기':
        return const ViewScreen();
      case '테스트하기':
        return const StreamTestScreen();
      default:
        return const RegisterScreen();
    }
  }
}
