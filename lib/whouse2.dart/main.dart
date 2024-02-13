// ignore_for_file: unused_local_variable

import 'package:accubooks/whouse2.dart/Ware_Home.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

main() async {
  await Hive.initFlutter();
  // open box
  var box = await Hive.openBox('Mybox');
  runApp(Myapp5());
}

class Myapp5 extends StatelessWidget {
  const Myapp5({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Home_Page());
  }
}
