// firestore function list in case of officially supported case (or working fine with official packages)
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:crud_tutorial/db/firestore_not_supported.dart';
import 'package:crud_tutorial/db/firestore_supported.dart';

bool isFirestoreSupported = true;

bool firestoreInit() {
  if (kIsWeb) {
    isFirestoreSupported = true;
    firestoreInitSupported();
  } else if (Platform.isAndroid || Platform.isIOS || Platform.isMacOS) {
    isFirestoreSupported = true;
    firestoreInitSupported();
  } else {
    isFirestoreSupported = false;
    firestoreInitNotSupported();
  }

  return isFirestoreSupported;
}

dynamic getFirestoreInstance() {
  if (isFirestoreSupported) {
    return getFirestoreInstanceSupported();
  } else {
    return getFirestoreInstanceNotSupported();
  }
}
