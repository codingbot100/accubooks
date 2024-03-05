import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ToDoDatabsestoreFactor {
  List allInOne = [];

// reference our box
  final _factoeBox = Hive.box('storeFactor');

  //run this method if this is the 1st time ever opening this app
  void createinitialData() {
    allInOne = [];
  }

  void loadData() {
    allInOne = _factoeBox.get('TODOFacto');
  }

  void updateDatabase() {
    _factoeBox.put('TODOFacto', allInOne);
  }

  void clearAllData() async {
    await _factoeBox.clear();
  }
}
