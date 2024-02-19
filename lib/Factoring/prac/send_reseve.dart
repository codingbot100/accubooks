import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyParentWidget(),
    );
  }
}

class MyParentWidget extends StatefulWidget {
  @override
  _MyParentWidgetState createState() => _MyParentWidgetState();
}

class _MyParentWidgetState extends State<MyParentWidget> {
  int myInteger = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Parent Widget'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Integer value: $myInteger',
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 20),
          MyChildWidget(onIntegerChanged: (newInteger) {
            setState(() {
              myInteger = newInteger;
            });
          }),
        ],
      ),
    );
  }
}

class MyChildWidget extends StatefulWidget {
  final Function(int) onIntegerChanged;

  MyChildWidget({required this.onIntegerChanged});

  @override
  _MyChildWidgetState createState() => _MyChildWidgetState();
}

class _MyChildWidgetState extends State<MyChildWidget> {
  int childInteger = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Child Integer value: $childInteger',
          style: TextStyle(fontSize: 16),
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              childInteger++;
              widget.onIntegerChanged(childInteger);
            });
          },
          child: Text('Increment Integer'),
        ),
      ],
    );
  }
}
