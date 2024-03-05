// ignore_for_file: dead_code

import 'package:accubooks/List_Products/data/database.dart';
import 'package:accubooks/List_Products/titleRows.dart';
import 'package:accubooks/List_Products/util/ToDotile2.dart';
import 'package:accubooks/List_Products/util/dialog_box.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';

class Home_Page extends StatefulWidget {
  const Home_Page({super.key});

  @override
  State<Home_Page> createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  List filteredList = [];
  TextEditingController _searchController = TextEditingController();

// reference the hive box
  final _myBox = Hive.box('Mybox');
  ToDoDatabse2 db = ToDoDatabse2();
  final controller = PageController(initialPage: 1);
  @override
  void initState() {
    //if this is the first time ever opening the app , then create default data
    if (_myBox.get("TODOLIST2") == null) {
      db.createinitialData();
    } else {
      db.loadData();
    }
    filteredList = List.from(db.allInOne);

    super.initState();
  }

  List<TextEditingController> _controllers = [
    TextEditingController(),
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
      db.allInOne.add(newTexts);

      Navigator.of(context).pop();
      _controllers.cast();
      db.updateDatabase();
      filteredList = List.from(db.allInOne);

      // _controllers.clear();
    });
  }

  // Create a new task
  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogeBox2(
            controllers: _controllers,
            onSave: saveNewTask,
            onCancel: () => Navigator.of(context).pop(),
          );
        });
  }

  void deleteTask(int index) {
    setState(() {
      db.allInOne.removeAt(index);
      filteredList = db.allInOne;
    });
    db.updateDatabase();
  }

  void updateTask(int index) {
    // Set the text for each controller based on the values from db.allInOne[index]
    for (int i = 0; i < _controllers.length; i++) {
      _controllers[i].text = db.allInOne[index][i];
    }

    showDialog(
      context: context,
      builder: (context) {
        return DialogeBox2(
          onSave: () {
            setState(() {
              // Update the values in db.allInOne[index] based on the controllers
              for (int i = 0; i < _controllers.length; i++) {
                db.allInOne[index][i] = _controllers[i].text;
              }
              print(db.allInOne);
              // Clear the controllers
              _controllers.forEach((controller) => controller.clear());

              Navigator.pop(context);
              db.updateDatabase();
              db.clearAllData();
            });
          },
          onCancel: () => Navigator.pop(context),
          controllers: _controllers,
        );
      },
    );
  }

  int pageNumber = 2;
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(),
      child: Scaffold(
          body: Center(
        child: Container(
          decoration: BoxDecoration(
              color: Color.fromRGBO(255, 255, 255, 1),
              borderRadius: BorderRadius.circular(10.0)),
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 25, bottom: 25),
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: Container(
                    child: ListTile(
                      title: Text("لیست اجناس ",
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w900,
                              fontFamily: 'YekanBakh')),
                      trailing: FaIcon(
                        FontAwesomeIcons.cubes,
                        size: 60,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    right: 20, left: 20, top: 20, bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Container(
                        //   height: 30,
                        //   decoration: BoxDecoration(
                        //       border: Border.all(width: 0.5),
                        //       color: Color.fromRGBO(248, 249, 251, 1),
                        //       borderRadius: BorderRadius.circular(6.5)),
                        //   child: MaterialButton(
                        //       onPressed: () {
                        //         setState(() {
                        //           // _showDialog(context);
                        //         });
                        //       },
                        //       child: Text(
                        //         "حذف همه",
                        //         style: TextStyle(
                        //             color: Colors.black,
                        //             fontSize: 16,
                        //             fontFamily: 'YekanBakh',
                        //             fontWeight: FontWeight.w600),
                        //       )),
                        // ),
                        // SizedBox(
                        //   width: 20,
                        // ),
                        Container(
                          height: 30,
                          decoration: BoxDecoration(
                              border: Border.all(width: 0.5),
                              color: Color.fromRGBO(248, 249, 251, 1),
                              borderRadius: BorderRadius.circular(6.5)),
                          child: MaterialButton(
                              onPressed: () => createNewTask(),
                              child: Text(
                                "+" " کالا جدید",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontFamily: 'YekanBakh',
                                    fontWeight: FontWeight.w600),
                              )),
                        ),
                      ],
                    ),
                    Container(
                        width: 250,
                        height: 35,
                        child: Directionality(
                            textDirection: TextDirection.rtl,
                            child: TextField(
                                controller: _searchController,
                                cursorHeight: 20,
                                textAlign: TextAlign.right,
                                textAlignVertical: TextAlignVertical.bottom,
                                style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'YekanBakh',
                                    fontWeight: FontWeight.w800),
                                decoration: InputDecoration(
                                    suffixIcon: Icon(Icons.search),
                                    hintText: 'جستجوی کالا...',
                                    hintStyle: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontFamily: 'YekanBakh'),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0))),
                                onChanged: (value) {
                                  setState(() {
                                    filteredList = db.allInOne
                                        .where((task) =>
                                            task[0].toLowerCase().contains(
                                                value.toLowerCase()) ||
                                            task[4].toLowerCase().contains(
                                                value.toLowerCase()) ||
                                            task[3]
                                                .toLowerCase()
                                                .contains(value.toLowerCase()))
                                        .toList();
                                  });
                                }))),
                  ],
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
                          titleRows(),
                          Divider(
                            thickness: 1,
                            color: Colors.blueAccent,
                          ),
                          Expanded(
                            child: Container(
                              height: double.infinity,
                              child: ListView.separated(
                                separatorBuilder: (context, index) {
                                  return Divider(
                                    thickness: 1,
                                  );
                                },
                                itemCount: filteredList.length,
                                itemBuilder: ((context, index) {
                                  int counter = index + 1;
                                  return Container(
                                    key: ValueKey<String>(
                                        filteredList[index][0]), // Add a key
                                    child: GestureDetector(
                                      onTap: () => updateTask(index),
                                      child: Directionality(
                                        textDirection: TextDirection.rtl,
                                        child: ToDotile2(
                                          counter: counter,
                                          Product_Name: filteredList[index][0],
                                          Number_of_goods:
                                              _parseInt(db.allInOne[index][1]),
                                          Barcode_number:
                                              _parseInt(db.allInOne[index][2]),
                                          Expiration_date: filteredList[index]
                                              [3],
                                          part: filteredList[index][4],
                                          provisions: _parseDouble(
                                              db.allInOne[index][5]),
                                          price: _parseDouble(
                                              db.allInOne[index][6]),
                                          deleteFunction: (context) =>
                                              deleteTask(index),
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.end,
              //   children: [
              //     Container(
              //       width: 120,
              //       height: 40,
              //       decoration: BoxDecoration(
              //           border: Border.all(width: 0.5),
              //           color: Color.fromRGBO(248, 249, 251, 1),
              //           borderRadius: BorderRadius.circular(6.5)),
              //       child: MaterialButton(
              //           onPressed: () {
              //             Navigator.push(
              //                 context,
              //                 MaterialPageRoute(
              //                     builder: (context) => LostDateGoods()));
              //           },
              //           child: Text('اجناس کم تاریخ')),
              //     ),
              //   ],
              // ),
            ],
          ),
        ),
      )),
    );
  }

  int _parseInt(String value) {
    try {
      return int.parse(value);
    } catch (e) {
      print("Error parsing integer: $value");
      return 0; // or handle the error in a way that makes sense for your app
    }
  }

  double _parseDouble(String value) {
    try {
      return double.parse(value);
    } catch (e) {
      print("Error parsing double: $value");
      return 0.0; // or handle the error in a way that makes sense for your app
    }
  }

  void _showSnackBar(BuildContext context, String message,
      [Color color = Colors.green]) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Center(
          child: Text(message),
        ),
        backgroundColor: color,
      ),
    );
  }

  void _showDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 70, right: 25),
                  child: Center(
                    child: Image.asset(
                      'icons/delete (2).png',
                      scale: 6,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Container(
                    height: 200,
                    width: 200,
                    child: Center(
                      child: Text(
                        " کل لیست را پاک کنم؟",
                        style: TextStyle(
                            fontFamily: 'Yekan',
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            titlePadding: EdgeInsets.only(left: 30),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 30,
                    width: 100,
                    decoration: BoxDecoration(
                        border: Border.all(width: 0.5),
                        color: Color.fromRGBO(248, 249, 251, 1),
                        borderRadius: BorderRadius.circular(6.5)),
                    child: MaterialButton(
                        onPressed: () {
                          setState(() {
                            Navigator.pop(context);
                          });
                        },
                        child: Text(
                          "لغو",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontFamily: 'YekanBakh',
                              fontWeight: FontWeight.w600),
                        )),
                  ),
                  Container(
                    height: 30,
                    width: 100,
                    decoration: BoxDecoration(
                        border: Border.all(width: 0.5),
                        color: Color.fromRGBO(248, 249, 251, 1),
                        borderRadius: BorderRadius.circular(6.5)),
                    child: MaterialButton(
                        onPressed: () {
                          setState(() {
                            db.clearAllData();
                            db.updateDatabase();
                            _controllers.cast();
                            Navigator.of(context).pop();
                            _showSnackBar(context, "موفقانه فاکتور ذخیره شد ");
                          });
                        },
                        child: Text(
                          "حذف ",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontFamily: 'YekanBakh',
                              fontWeight: FontWeight.w600),
                        )),
                  ),
                ],
              )
            ],
          );
        });
  }
}
