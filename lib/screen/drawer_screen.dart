import 'package:crud_tutorial/screen/screen_selector.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:crud_tutorial/constants.dart';

import '../db/firestore_function.dart';

class DrawerScreen extends StatelessWidget {
  DrawerScreen({Key? key}) : super(key: key);

  bool _isInit = false;

  @override
  Widget build(BuildContext context) {
    // 테스트하기 메뉴 : firebase 공식 지원인 경우만 (StreamBuilder 이슈)
    if (isFirestoreSupported == true) {}

    return ListView(
      primary: false, // to avoid multiple primary scrolls in one route
      children: <Widget>[
        const SizedBox(
          height: 80.0,
          child: DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              kAppName,
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
        ),
        ListTile(
          leading: const Icon(Icons.search),
          title: const Text('살펴보기'),
          onTap: () {
            context.read<ScreenSelector>().moveScreen('살펴보기');
            Navigator.of(context).pop();
          },
        ),
        ListTile(
          leading: const Icon(Icons.app_registration),
          title: const Text('등록하기'),
          onTap: () {
            context.read<ScreenSelector>().moveScreen('등록하기');
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
