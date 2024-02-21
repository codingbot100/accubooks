import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ToDoDatabsestoreFactor {
  List allInOne = [];

// reference our box
  final factoeBox = Hive.box('storeFactor');

  //run this method if this is the 1st time ever opening this app
  void createinitialData() {
    allInOne = [];
  }

  void loadData() {
    allInOne = factoeBox.get('TODOLIST2');
  }

  void updateDatabase() {
    factoeBox.put('TODOLIST2', allInOne);
  }

  void clearAllData() async {
    await factoeBox.clear();
  }
}
