import 'package:flutter/foundation.dart';

class DataProvider with ChangeNotifier {
  List<List<String>> _temporaryData = [
    ["", ""],
  ];

  List<List<String>> get temporaryData => _temporaryData;

  void updateTemporaryData(List<List<String>> newData) {
    _temporaryData = newData;
    notifyListeners();
  }
}
