import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ParentWidget(),
    );
  }
}

class ParentWidget extends StatefulWidget {
  @override
  _ParentWidgetState createState() => _ParentWidgetState();
}

class _ParentWidgetState extends State<ParentWidget> {
  List Dropvalues = ["one", 'two', "three", "four", "five"];
  List DropMenu = [
    'شوینده باب',
    "حبوبات",
    "شیرینی باب",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Parent Widget'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DropdownButton(
              icon: Icon(Icons.menu),
              value: Dropvalues,
              items: [
                for (int index = 0; index < DropMenu.length; index++)
                  DropdownMenuItem(
                    value: DropMenu[index],
                    child: Text("${DropMenu[index]}"),
                  )
              ],
              onChanged: (me) {
                List me = [];
                if (me != null) {
                  setState(() {
                    Dropvalues = me;
                  });
                }
              }),
        ],
      ),
    );
  }
}
