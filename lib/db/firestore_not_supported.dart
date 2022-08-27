// firestore function list in case of not supported case (working with firedart package)
// referenced from https://www.youtube.com/watch?v=Tw7L2NkhwPc (Flutter Firebase: Cloud Firestore Basics on Windows)

import 'package:firedart/firedart.dart';
import 'dart:io';
import 'package:crud_tutorial/firebase_options.dart';

Firestore _firestore = Firestore.instance;

void firestoreInitNotSupported() {
  if (Platform.isWindows) {
    Firestore.initialize(DefaultFirebaseOptions.windows.projectId);
  } else if (Platform.isLinux) {
    Firestore.initialize(DefaultFirebaseOptions.linux.projectId);
  }
}

Firestore getFirestoreInstanceNotSupported() {
  return _firestore;
}
