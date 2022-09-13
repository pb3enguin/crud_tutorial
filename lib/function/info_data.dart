import 'package:flutter/material.dart';

class PersonInfo with ChangeNotifier {
  String _name = '';
  String _telNo = '';
  String _birthday = '';

  void changeName(String input) {
    _name = input;
    notifyListeners();
  }

  void changeTelNo(String input) {
    _telNo = input;
    notifyListeners();
  }

  void changeBirth(String input) {
    _birthday = input;
    notifyListeners();
  }

  String getName() => _name;
  String getTelNo() => _telNo;
  String getBirth() => _birthday;

  void clear() {
    _name = '';
    _telNo = '';
    _birthday = '';
  }

  Map<String, dynamic> toJson() => {
        'name': _name,
        'telNo': _telNo,
        'birthday': _birthday,
      };
}

// explicitly for register page (state management)
class PersonInfoReg extends PersonInfo {}
