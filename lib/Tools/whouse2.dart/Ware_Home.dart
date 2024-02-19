import 'package:accubooks/whouse2.dart/data/database.dart';
import 'package:accubooks/whouse2.dart/util/ToDotile2.dart';
import 'package:accubooks/whouse2.dart/util/dialog_box.dart';
import 'package:flutter/material.dart';
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
       _controllers.clear();
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
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: Container(
                    // width: 700,
                    child: ListTile(
                      title: Text("لیست اجناس ",
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w900,
                              fontFamily: 'YekanBakh')),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      right: 20, left: 20, top: 20, bottom: 20),
                  child: Row(
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
                      //           db.clearAllData();
                      //           db.updateDatabase();
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
                      // FloatingActionButton(onPressed:()=> createNewTask(),child:Icon(Icons.add)),
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
                                        .where((task) => task[0]
                                            .toLowerCase()
                                            .contains(value.toLowerCase()))
                                        .toList();
                                  });
                                },
                              ))),
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
                            Container(
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      "قیمت فروش",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'YekanBakh'),
                                    ),
                                    SizedBox(
                                      width: 25,
                                    ),
                                    Text(
                                      "قیمت خرید",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'YekanBakh'),
                                    ),
                                    SizedBox(
                                      width: 25,
                                    ),
                                    Text('تاریخ انقضا',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'YekanBakh')),
                                    SizedBox(
                                      width: 25,
                                    ),
                                    Text('نمبر بارکد',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'YekanBakh')),
                                    SizedBox(
                                      width: 25,
                                    ),
                                    Text('تعداد کالا',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'YekanBakh')),
                                    SizedBox(
                                      width: 25,
                                    ),
                                    Text('نام کالا',
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
                                itemCount: filteredList.length,
                                itemBuilder: ((context, index) {
                                  int counter = index + 1;
                                  return GestureDetector(
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
                                        Expiration_date: db.allInOne[index][3],
                                        provisions:
                                            _parseDouble(db.allInOne[index][4]),
                                        price:
                                            _parseDouble(db.allInOne[index][5]),
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
}
