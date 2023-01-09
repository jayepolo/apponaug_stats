import 'dart:async';
import 'package:firebase_database/firebase_database.dart';

class FirebaseMgr {
  final dbRef = FirebaseDatabase.instance;

  final StreamController<String> _boilerStats = StreamController<String>();

  // get Boiler status
  Stream<String> getBoilerStatus() {
    final boilerMsg = dbRef.ref('BoilerOpsRT').child('boilerMsg');
    boilerMsg.onChildChanged.listen((event) {
      final snapshotStatus = event.snapshot.value.toString();
//      if (event.snapshot.key == 'sample') {
      _boilerStats.sink.add(snapshotStatus);
      print('newchangeObject: $snapshotStatus');
//      }
    });
    return _boilerStats.stream;
  }
}
