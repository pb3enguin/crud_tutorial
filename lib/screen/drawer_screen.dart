import 'package:crud_tutorial/screen/screen_selector.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:crud_tutorial/constants.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
