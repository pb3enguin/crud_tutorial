import 'dart:convert';
import 'dart:developer';

import 'package:crud_tutorial/function/info_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../function/person_info_firestore.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController telNoController = TextEditingController();
  final TextEditingController birthdayController = TextEditingController();

  String _regName = '';
  String _regTelNo = '';
  String _regBirthday = '';

  FireStorePersonInfoFunction fireFunction = FireStorePersonInfoFunction();

  void registerAction(String name, String telNo, String birthday) {
    setState(() {
      _regName = name;
      _regTelNo = telNo;
      _regBirthday = birthday;
    });
  }

  void clearField() {
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
                  onChanged: context.read<PersonInfoReg>().changeName,
                ),
                InputFieldWidget(
                  editingController: telNoController,
                  title: "전화번호",
                  hintText: "010-XXXX-XXXX",
                  onChanged: context.read<PersonInfoReg>().changeTelNo,
                ),
                InputFieldWidget(
                  editingController: birthdayController,
                  title: "생일",
                  hintText: "생일을 입력하세요",
                  onChanged: context.read<PersonInfoReg>().changeBirth,
                ),
              ],
            ),
            Center(
              // Register button
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextButton(
                  onPressed: () {
                    registerAction(
                      context.read<PersonInfoReg>().getName(),
                      context.read<PersonInfoReg>().getTelNo(),
                      context.read<PersonInfoReg>().getBirth(),
                    );
                    fireFunction
                        .uploadPersonInfoData(context.read<PersonInfoReg>());
                    log(jsonEncode(context.read<PersonInfoReg>()));
                    context.read<PersonInfoReg>().clear();
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
                RegResultBox(name: "이름"),
                RegResultBox(name: "전화번호"),
                RegResultBox(name: "생년월일"),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              // Registered Info
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RegResultBox(name: _regName),
                RegResultBox(name: _regTelNo),
                RegResultBox(name: _regBirthday),
              ],
            ),
          ],
        )
      ],
    );
  }
}

class RegResultBox extends StatelessWidget {
  const RegResultBox({
    Key? key,
    required String name,
  })  : _name = name,
        super(key: key);

  final String _name;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: Text(
        _name,
        style: const TextStyle(fontSize: 30),
      ),
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
