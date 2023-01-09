import 'dart:async';

import 'package:apponaug_stats/models/firebase_apponaugdata.dart';

class HomeViewModel {
  final StreamController<String> _dataElement = StreamController<String>();
  Stream<String> get dataElement => _dataElement.stream;

  final FirebaseMgr _firebaseMgr = FirebaseMgr();

  void fetchStats() {
    _firebaseMgr.getBoilerStatus().listen(((event) {
      _dataElement.sink.add(event);
    }));
  }
}
