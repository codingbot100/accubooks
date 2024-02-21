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
  late _ChildWidgetState childWidgetState;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Parent Widget'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () {
                childWidgetState.incrementChildCounter();
              },
              child: Text("increment Child Counter")),
          ChildWidget(parentReference: this)
        ],
      ),
    );
  }
}

class ChildWidget extends StatefulWidget {
  final _ParentWidgetState parentReference;

  const ChildWidget({Key? key, required this.parentReference})
      : super(key: key);

  @override
  _ChildWidgetState createState() => _ChildWidgetState();
}

class _ChildWidgetState extends State<ChildWidget> {
  int childCounter = 0;
  void incrementChildCounter() {
    setState(() {
      childCounter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    widget.parentReference.childWidgetState = this;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Child Counter: $childCounter'),
      ],
    );
  }
}


