import 'package:accubooks/Factoring/prac/mybuttons.dart';
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
  String topic = 'packages';
  
  int counter = 0;
  Callback(VarTopic, int counterPluse) {
    setState(() {
      topic = VarTopic;
      counter;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text("Learning Flutter"),
      ),
      body: Column(children: [
        Container(
          color: Colors.lightBlue,
          width: 300,
          height: 70,
          margin: EdgeInsets.only(top: 50, left: 40, right: 40, bottom: 20),
          child: Center(
            child: Text("we are learning flutter  " + topic),
          ),
        ),
        Container(
          color: Colors.lightBlue,
          width: 300,
          height: 70,
          margin: EdgeInsets.only(top: 50, left: 40, right: 40, bottom: 20),
          child: Center(
            child: Text("$counter"),
          ),
        ),
        mybuttons(
          topic: 'cubit',
          callbackFunction: Callback,
          counter: counter++,
        )
      ]),
    ));
  }
}
