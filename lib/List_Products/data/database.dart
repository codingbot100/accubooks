import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ToDoDatabse2 {
  List allInOne = [];
   List LostDateGoods = [];

// reference our box
  final _myBox = Hive.box('mybox');

  //run this method if this is the 1st time ever opening this app
  void createinitialData() {
    allInOne = [
      {
        'id': 1,
        'title': 'Buy groceries',
        'description': 'Buy groceries',
        'date': '2021-01-01',
      },
      {
        'id': 2,
        'title': 'Buy groceries',
        'description': 'Buy groceries',
        'date': '2021-01-01',
      },
      {
        'id': 3,
        'title': 'Buy groceries',
        'description': 'Buy groceries',
        'date': '2021-01-01',
      },
      {
        'id': 4,
        'title': 'Buy groceries',
        'description': 'Buy groceries',
        'date': '2021-01-01',
      },
    ];
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
     //LostDataGoods

      void createinitialDataLostDate() {
      LostDateGoods = [];
     }
   
     void loadDataLostDateGoods() {
    allInOne = _myBox.get('LOSTDATEGoods');
  }

   void updateDatabaseLostDateGoods() {
    _myBox.put('LOSTDATEGoods', LostDateGoods); //
  }
  void clearLostDateGoods() async {
    await _myBox.clear();
  }
}
