// ignore_for_file: unused_local_variable

import 'package:accubooks/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

main() async {
  await Hive.initFlutter();
    WidgetsFlutterBinding.ensureInitialized();
  // open box
  var box = await Hive.openBox('Mybox');
  var employees = await Hive.openBox('employees');
  var factoeBox = await Hive.openBox('storeFactor');
  var yourBox = await Hive.openBox("yourBox");
  var dropbox = await Hive.openBox("dropDatabase");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Color(0xFF423659),
          backgroundColor: Color(0xFFFFFFFF),
          scaffoldBackgroundColor: Color(0xFFFFFFFF),
          textTheme: TextTheme()),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
