import 'package:accubooks/Factoring/data_save/dataProvider.dart';
import 'package:accubooks/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

 main() async {
  await Hive.initFlutter();
  // open box
  // ignore: unused_local_variable
  var box = await Hive.openBox('Mybox');
    var employees = await Hive.openBox('employees');

  WidgetsFlutterBinding.ensureInitialized();
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
        home: ChangeNotifierProvider(
          create: (context) => DataProvider(),
          child: HomePage(),
        ));
  }
}
