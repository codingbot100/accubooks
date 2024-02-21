import 'package:flutter/material.dart';

main() {
  runApp(firstPage());
}

class firstPage extends StatefulWidget {
  const firstPage({super.key});

  @override
  State<firstPage> createState() => _firstPageState();
}

class _firstPageState extends State<firstPage> {
  var txt = "samplet text";
  void funchange() {
    setState(() {
      txt = 'New Text ';
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: Column(children: [
        Center(
          child: Text(txt),
        ),
        ElevatedButton(
          onPressed: () {},
          child: Text("change"),
        )
      ]),
    ));
  }
}
