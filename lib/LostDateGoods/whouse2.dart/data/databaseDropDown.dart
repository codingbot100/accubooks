// import 'package:hive/hive.dart';
// import 'package:hive_flutter/hive_flutter.dart';

// class ToDoDatabseDropDown {
//   List<String> listDrop = [];

// // reference our box
//   final _DropBox = Hive.box('dropDatabase');

//   //run this method if this is the 1st time ever opening this app
//   void createinitialData() {
//     listDrop = ['One', 'Two', "Three"];
//   }

//   void loadData() {
//     listDrop = _DropBox.get('dropkey');
//   }

//   void updateDatabase() {
//     _DropBox.put('dropkey', listDrop);
//   }

//   void clearAllData() async {
//     await _DropBox.clear();
//   }
// }
