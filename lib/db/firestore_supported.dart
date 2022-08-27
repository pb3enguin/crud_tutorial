// firestore function list in case of officially supported case (or working fine with official packages)
import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore _firestore = FirebaseFirestore.instance;

void firestoreInitSupported() {
  // do nothing
}

FirebaseFirestore getFirestoreInstanceSupported() {
  return _firestore;
}
