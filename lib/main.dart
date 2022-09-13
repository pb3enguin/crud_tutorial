import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:crud_tutorial/db/firestore_function.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'function/info_data.dart';
import 'screen/drawer_screen.dart';
import 'screen/screen_selector.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  firestoreInit(); // init firestore depending on type

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ScreenSelector()),
        ChangeNotifierProvider(create: (_) => PersonInfoReg()),
      ],
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CRUD Test"),
      ),
      drawer: const Drawer(
        child: DrawerScreen(),
      ),
      body: context.watch<ScreenSelector>().getScreeen(),
    );
  }
}
