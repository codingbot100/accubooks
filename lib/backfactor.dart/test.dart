import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  final String name;
  final String barcode;

  const Test({Key? key, required this.name, required this.barcode})
      : super(key: key);

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  late TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController(text: widget.name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.name,
              style: TextStyle(fontSize: 30),
            ),
            TextField(
              controller: controller,
              decoration: InputDecoration(labelText: 'Enter Name'),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Test(name: 'Initial Name', barcode: '123456'),
  ));
}
