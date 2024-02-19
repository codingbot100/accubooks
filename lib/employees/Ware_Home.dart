import 'package:accubooks/employees/data/database.dart';
import 'package:accubooks/employees/util/ToDotile2.dart';
import 'package:accubooks/employees/util/dialog_box.dart';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';

class employees extends StatefulWidget {
  const employees({super.key});

  @override
  State<employees> createState() => _employeesState();
}

class _employeesState extends State<employees> {
  List filteredList = [];

// reference the hive box
  final _myBox = Hive.box('employees');
  ToDoDatabseEmployees db2 = ToDoDatabseEmployees();

  @override
  void initState() {
    //if this is the first time ever opening the app , then create default data
    if (_myBox.get("TODOLIST2") == null) {
      db2.createinitialData();
    } else {
      db2.loadData();
    }
    filteredList = List.from(db2.allInOne);

    super.initState();
  }

  List<TextEditingController> _controllers = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];

  void saveNewTask() {
    setState(() {
      List<String> newTexts = [];
      for (int i = 0; i < _controllers.length; i++) {
        newTexts.add(_controllers[i].text);
      }
      db2.allInOne.add(newTexts);

      Navigator.of(context).pop();
      _controllers.cast();
      db2.updateDatabase();
      filteredList = List.from(db2.allInOne);
      // _controllers.clear();
    });
  }

  // Create a new task
  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogeEmployess(
            controllers: _controllers,
            onSave: saveNewTask,
            onCancel: () => Navigator.of(context).pop(),
          );
        });
  }

  void deleteTask(int index) {
    setState(() {
      db2.allInOne.removeAt(index);
      filteredList = db2.allInOne;
    });
    db2.updateDatabase();
  }

  void updateTask(int index) {
    // Set the text for each controller based on the values from db.allInOne[index]
    for (int i = 0; i < _controllers.length; i++) {
      _controllers[i].text = db2.allInOne[index][i];
    }

    showDialog(
      context: context,
      builder: (context) {
        return DialogeEmployess(
          onSave: () {
            setState(() {
              // Update the values in db.allInOne[index] based on the controllers
              for (int i = 0; i < _controllers.length; i++) {
                db2.allInOne[index][i] = _controllers[i].text;
              }

              // Clear the controllers
              _controllers.forEach((controller) => controller.clear());

              Navigator.pop(context);
              db2.updateDatabase();
              db2.clearAllData();
            });
          },
          onCancel: () => Navigator.pop(context),
          controllers: _controllers,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(),
      child: Scaffold(
          body: Padding(
        padding:
            const EdgeInsets.only(right: 80, left: 80, top: 40, bottom: 50),
        child: Center(
          child: Container(
            decoration: BoxDecoration(
                color: Color.fromRGBO(248, 248, 251, 1),
                borderRadius: BorderRadius.circular(10.0)),
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Container(
                      // width: 700,
                      child: ListTile(
                        //   leading:  Container(
                        //   height: 30,
                        //   decoration: BoxDecoration(
                        //       border: Border.all(width: 0.5),
                        //       color: Color.fromRGBO(248, 249, 251, 1),
                        //       borderRadius: BorderRadius.circular(6.5)),
                        //   child: MaterialButton(
                        //       onPressed: () {
                        //         setState(() {
                        //           db2.clearAllData();
                        //           db2.updateDatabase();
                        //           _controllers.cast();
                        //         });
                        //       },
                        //       child: Text(
                        //         "پاک کردن کل لیست",
                        //         style: TextStyle(
                        //             color: Colors.black,
                        //             fontSize: 16,
                        //             fontFamily: 'YekanBakh',
                        //             fontWeight: FontWeight.w600),
                        //       )),
                        // ),
                        trailing: Container(
                          height: 30,
                          decoration: BoxDecoration(
                              border: Border.all(width: 0.5),
                              color: Color.fromRGBO(248, 249, 251, 1),
                              borderRadius: BorderRadius.circular(6.5)),
                          child: MaterialButton(
                              onPressed: () => createNewTask(),
                              child: Text(
                                "+ " + "" " کارمند  جدید",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontFamily: 'YekanBakh',
                                    fontWeight: FontWeight.w600),
                              )),
                        ),
                        title: Text("لیست کارکنان ",
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w900,
                                fontFamily: 'YekanBakh')),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    child: Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 10,
                        ),
                        child: Column(
                          children: [
                            Container(
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      "معاش",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'YekanBakh'),
                                    ),
                                    SizedBox(
                                      width: 25,
                                    ),
                                    Text(
                                      " سطح تحصیل",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'YekanBakh'),
                                    ),
                                    SizedBox(
                                      width: 25,
                                    ),
                                    Text('تاریخ استخدام',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'YekanBakh')),
                                    SizedBox(
                                      width: 25,
                                    ),
                                    Text('محل سکونت',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'YekanBakh')),
                                    SizedBox(
                                      width: 25,
                                    ),
                                    Text(' نام پدر ',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'YekanBakh')),
                                    SizedBox(
                                      width: 25,
                                    ),
                                    Text('نام کارمند',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'YekanBakh')),
                                    Text("شماره",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'YekanBakh')),
                                  ]),
                            ),
                            Divider(
                              thickness: 1,
                              color: Colors.blueAccent,
                            ),
                            Expanded(
                              child: ListView.separated(
                                separatorBuilder: (context, index) {
                                  return Divider(
                                    thickness: 1,
                                  );
                                },
                                itemCount: db2.allInOne.length,
                                itemBuilder: ((context, index) {
                                  int counter = index + 1;
                                  return GestureDetector(
                                    onTap: () => updateTask(index),
                                    child: Directionality(
                                      textDirection: TextDirection.rtl,
                                      child: ToDoEmployees(
                                        counter: counter,
                                        Name: db2.allInOne[index][0],
                                        Father_s_name: db2.allInOne[index][1],
                                        Address: db2.allInOne[index][2],
                                        date_of_employeement:
                                            db2.allInOne[index][3],
                                        education: db2.allInOne[index][4],
                                        Salary: db2.allInOne[index][5],
                                        deleteFunction: (context) =>
                                            deleteTask(index),
                                      ),
                                    ),
                                  );
                                }),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
