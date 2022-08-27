import 'dart:developer';

import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController telNoController = TextEditingController();
  final TextEditingController birthdayController = TextEditingController();

  String _name = '';
  String _telNo = '';
  String _birthday = '';

  String _regName = '';
  String _regTelNo = '';
  String _regBirthday = '';

  void changeName(String input) {
    _name = input;
    log(_name);
  }

  void changeTelNo(String input) {
    _telNo = input;
    log(_telNo);
  }

  void changeBirth(String input) {
    _birthday = input;
    log(_birthday);
  }

  void registerAction(String name, String telNo, String birthday) {
    setState(() {
      _regName = name;
      _regTelNo = telNo;
      _regBirthday = birthday;
    });
  }

  void clearField() {
    _name = '';
    _telNo = '';
    _birthday = '';

    nameController.clear();
    telNoController.clear();
    birthdayController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              // Input Textfileds
              children: <Widget>[
                InputFieldWidget(
                  editingController: nameController,
                  title: "이름",
                  hintText: "이름을 입력하세요",
                  onChanged: changeName,
                ),
                InputFieldWidget(
                  editingController: telNoController,
                  title: "전화번호",
                  hintText: "010-XXXX-XXXX",
                  onChanged: changeTelNo,
                ),
                InputFieldWidget(
                  editingController: birthdayController,
                  title: "생일",
                  hintText: "생일을 입력하세요",
                  onChanged: changeBirth,
                ),
              ],
            ),
            Center(
              // Register button
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextButton(
                  onPressed: () {
                    registerAction(_name, _telNo, _birthday);
                    clearField();
                  },
                  style: TextButton.styleFrom(
                      side: const BorderSide(color: Colors.blue, width: 2),
                      padding: const EdgeInsets.all(10.0)),
                  child: const Text(
                    '등록',
                    style: TextStyle(fontSize: 30),
                  ),
                ),
              ),
            ),
          ],
        ),
        Column(
          // Register Info Diplay
          children: [
            Row(
              // Register Info Column
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                SizedBox(
                  width: 200,
                  child: Text(
                    "이름",
                    style: TextStyle(fontSize: 30),
                  ),
                ),
                SizedBox(
                  width: 200,
                  child: Text(
                    "전화번호",
                    style: TextStyle(fontSize: 30),
                  ),
                ),
                SizedBox(
                  width: 200,
                  child: Text(
                    "생년월일",
                    style: TextStyle(fontSize: 30),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              // Registered Info
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 200,
                  child: Text(
                    _regName,
                    style: const TextStyle(fontSize: 30),
                  ),
                ),
                SizedBox(
                  width: 200,
                  child: Text(
                    _regTelNo,
                    style: const TextStyle(fontSize: 30),
                  ),
                ),
                SizedBox(
                  width: 200,
                  child: Text(
                    _regBirthday,
                    style: const TextStyle(fontSize: 30),
                  ),
                ),
              ],
            ),
          ],
        )
      ],
    );
  }
}

class InputFieldWidget extends StatelessWidget {
  InputFieldWidget({
    required this.editingController,
    required this.title,
    required this.hintText,
    required this.onChanged,
    Key? key,
  }) : super(key: key);

  late final TextEditingController editingController;
  late final String title;
  late final String hintText;
  late void Function(String)? onChanged;

  String content = '';

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: 80,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              title,
              style: const TextStyle(fontSize: 15.0),
            ),
          ),
        ),
        SizedBox(
          width: 150,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0))),
                hintText: hintText,
              ),
              controller: editingController,
              onChanged: onChanged,
            ),
          ),
        ),
      ],
    );
  }
}
