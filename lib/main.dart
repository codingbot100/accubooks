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
  var saveFactor = await Hive.openBox("drop");
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  
  MyApp({
    super.key,
 
  });

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    final bool isDark;
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Color(0xFF423659),
          backgroundColor: Color.fromARGB(243, 243, 243, 1),
          scaffoldBackgroundColor: Color.fromRGBO(243, 243, 243, 1),
          textTheme: TextTheme()),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
