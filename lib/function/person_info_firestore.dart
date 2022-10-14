import 'dart:developer';
import 'package:firedart/firestore/models.dart';
import 'package:flutter/cupertino.dart';
import 'package:pluto_grid/pluto_grid.dart';
import '../db/firestore_function.dart';

class FireStorePersonInfo with ChangeNotifier {
  late dynamic fireInstance;
  late dynamic fireDB;

  FireStorePersonInfo() {
    fireInstance = getFirestoreInstance();
    fireDB = fireInstance.collection('person_info');
  }

  void upload(dynamic object) async {
    Document result = await fireDB.add(object.toJson());
    // result.catchError((error) {
    //   // error가 해당 에러를 출력
    //   log('error: $error');
    // });
  }

  Future<dynamic> getCollection() async {
    var documentSnapshot = await fireDB.get();
    print(documentSnapshot);
    return documentSnapshot;
  }
}
