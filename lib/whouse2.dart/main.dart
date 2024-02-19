// // ignore_for_file: unused_local_variable

// import 'package:accubooks/Factoring/data_save/dataProvider.dart';
// import '../../whouse2.dart/Ware_Home.dart';
// import 'package:flutter/material.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:provider/provider.dart';

// main() async {
//   await Hive.initFlutter();
//   // open box
//   var box = await Hive.openBox('Mybox');
//   runApp(Myapp5());
// }

// class Myapp5 extends StatelessWidget {
//   const Myapp5({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(home: ChangeNotifierProvider(
//         create: (context) => DataProvider(),
//         child: Home_Page(),
//       ),
//     );
//   }
// }