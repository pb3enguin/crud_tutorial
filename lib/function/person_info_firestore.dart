import '../db/firestore_function.dart';

class FireStorePersonInfoFunction {
  late dynamic fireInstance;
  late dynamic fireDB;

  FireStorePersonInfoFunction() {
    fireInstance = getFirestoreInstance();
    fireDB = fireInstance.collection('data');
  }

  void uploadPersonInfoData(dynamic object) {
    fireDB.add(object.toJson());
  }
}
