import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'package:crud_tutorial/function/info_data.dart';

import '../function/input_field.dart';
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

  FireStorePersonInfo fireFunction = FireStorePersonInfo();

  void registerComplete(String name, String telNo, String birthday) {
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
    return Consumer<PersonInfoReg>(
      builder: (_, info, __) => Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                // Input Textfileds
                children: <Widget>[
                  InputFieldWidget(
                    type: 'text',
                    editingController: nameController,
                    title: "이름",
                    hintText: "이름 입력",
                    onChanged: info.changeName,
                  ),
                  InputFieldWidget(
                    type: 'number',
                    editingController: telNoController,
                    title: "전화번호",
                    hintText: "010-XXXX-XXXX",
                    onChanged: info.changeTelNo,
                  ),
                  InputFieldWidget(
                    type: 'date',
                    editingController: birthdayController,
                    title: "생일",
                    hintText: "생일 입력",
                    onChanged: info.changeBirth,
                  ),
                ],
              ),
              Center(
                // Register button
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextButton(
                    onPressed: () {
                      if (info.isValid()) {
                        context.read<FireStorePersonInfo>().upload(info);
                        log(jsonEncode(info));
                        registerComplete(
                          info.getName(),
                          info.getTelNo(),
                          info.getBirth(),
                        );
                        info.clear();
                        clearField();
                      }
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
          const SizedBox(height: 20.0),
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
      ),
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
