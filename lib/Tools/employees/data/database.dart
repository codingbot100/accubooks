import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ToDoDatabseEmployees {
  List allInOne = [];

// reference our box
  final _myBox = Hive.box('employees');

  //run this method if this is the 1st time ever opening this app
  void createinitialData() {
    allInOne = [];
  }

  void loadData() {
    allInOne = _myBox.get('TODOLIST2');
  }

  void updateDatabase() {
    _myBox.put('TODOLIST2', allInOne);
  }
  void clearAllData() async {
    await _myBox.clear();
  }
}
