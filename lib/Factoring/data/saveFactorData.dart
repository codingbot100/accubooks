import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class save_factor_database {
  List factorAll = [];

// reference our box
  final _saveFactor = Hive.box('drop');
   


  //run this method if this is the 1st time ever opening this app
  void createinitialData() {
    factorAll = [];
  }

  void loadData() {
    factorAll =_saveFactor.get('TODOFactory');
  }

  void updateDatabase() {
    _saveFactor.put('TODOFactory', factorAll);
  }

  void clearAllData() async {
    await _saveFactor.clear();
  }
}
