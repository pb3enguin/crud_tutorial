import 'package:flutter/material.dart';
import 'package:pluto_grid/pluto_grid.dart';

class PersonInfo with ChangeNotifier {
  String _name = '';
  String _telNo = '';
  String _birthday = '';

  PersonInfo();

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

  bool checkName() => _name.isNotEmpty ? true : false; // 1 char name allowed
  bool checkTelNo() => _telNo.length >= 8 ? true : false; // allow XXXX-XXXX
  bool checkBirth() =>
      _birthday.length >= 8 ? true : false; // YYYY-M-D -> min. length = 8

  bool isValid() {
    return checkName() && checkTelNo() && checkBirth();
  }

  PersonInfo.fromJson(Map<String, dynamic> json) {
    _name = json['name'];
    _telNo = json['telNo'];
    _birthday = json['birthday'];
  }

  Map<String, dynamic> toJson() => {
        'name': _name,
        'telNo': _telNo,
        'birthday': _birthday,
      };

  // TODO: move to appropriate code
  PlutoRow getPlutoRow() {
    return PlutoRow(cells: {
      'name': PlutoCell(value: _name),
      'telNo': PlutoCell(value: _telNo),
      'birthday': PlutoCell(value: _birthday),
    });
  }
}

// explicitly for register page (state management)
class PersonInfoReg extends PersonInfo {}
