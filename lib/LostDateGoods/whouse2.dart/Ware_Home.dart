import 'package:accubooks/whouse2.dart/data/database.dart';
import 'package:accubooks/whouse2.dart/titleRows.dart';
import 'package:accubooks/whouse2.dart/util/ToDotile2.dart';
import 'package:accubooks/whouse2.dart/util/dialog_box.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';

class LostDateGoods extends StatefulWidget {
  const LostDateGoods({super.key});

  @override
  State<LostDateGoods> createState() => _LostDateGoodsState();
}

class _LostDateGoodsState extends State<LostDateGoods> {
  List filteredList = [];
  TextEditingController _searchController = TextEditingController();

  final _myBox = Hive.box('Mybox');
  ToDoDatabse2 db = ToDoDatabse2();
  final controller = PageController(initialPage: 1);

  @override
  void initState() {
    if (_myBox.get("TODOLIST2") == null) {
      db.createinitialData();
    } else {
      db.loadData();
    }
    updateFilteredList();
    super.initState();
  }

  void updateFilteredList() {
    setState(() {
      filteredList = db.allInOne.where((task) {
        try {
          DateTime expirationDate = DateTime.parse(task[3]);
          int daysDifference = expirationDate.difference(DateTime.now()).inDays;
          return daysDifference < 0 || daysDifference < 30;
        } catch (e) {
          print("Error parsing date: ${task[3]}");
          return false;
        }
      }).toList();
    });
  }

  List<TextEditingController> _controllers = List.generate(
    7,
    (index) => TextEditingController(),
  );

  void saveNewTask() {
    setState(() {
      List<String> newTexts = [];
      for (int i = 0; i < _controllers.length; i++) {
        newTexts.add(_controllers[i].text);
      }
      db.allInOne.add(newTexts);

      Navigator.of(context).pop();
      db.updateDatabase();
      updateFilteredList();
    });
  }

  void deleteTask(int index) {
    setState(() {
      db.allInOne.removeAt(index);
      updateFilteredList();
    });
    db.updateDatabase();
  }

  void updateTask(int index) {
    for (int i = 0; i < _controllers.length; i++) {
      _controllers[i].text = db.allInOne[index][i];
    }

    showDialog(
      context: context,
      builder: (context) {
        return DialogeBox2(
          onSave: () {
            setState(() {
              for (int i = 0; i < _controllers.length; i++) {
                db.allInOne[index][i] = _controllers[i].text;
              }
              _controllers.forEach((controller) => controller.clear());
              Navigator.pop(context);
              db.updateDatabase();
              db.clearAllData();
              updateFilteredList();
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
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back),
        ),
        body: Padding(
          padding:
              const EdgeInsets.only(right: 80, left: 80, top: 40, bottom: 50),
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                color: Color.fromRGBO(248, 248, 251, 1),
                borderRadius: BorderRadius.circular(10.0),
              ),
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
                          title: Text(
                            "لیست اجناس ",
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w900,
                              fontFamily: 'YekanBakh',
                            ),
                          ),
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
                      right: 20,
                      left: 20,
                      top: 20,
                      bottom: 20,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
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
                                fontWeight: FontWeight.w800,
                              ),
                              decoration: InputDecoration(
                                suffixIcon: Icon(Icons.search),
                                hintText: 'جستجوی کالا...',
                                hintStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontFamily: 'YekanBakh',
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                              onChanged: (value) {
                                setState(() {
                                  updateFilteredList();
                                  if (value.isNotEmpty) {
                                    filteredList = filteredList
                                        .where((task) =>
                                            task[0].toLowerCase().contains(
                                                value.toLowerCase()) ||
                                            task[4].toLowerCase().contains(
                                                value.toLowerCase()) ||
                                            task[3]
                                                .toLowerCase()
                                                .contains(value.toLowerCase()))
                                        .toList();
                                  }
                                });
                              },
                            ),
                          ),
                        ),
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
                                          filteredList[index][0], // Add a key
                                        ),
                                        child: GestureDetector(
                                          onTap: () => updateTask(index),
                                          child: Directionality(
                                            textDirection: TextDirection.rtl,
                                            child: ToDotile2(
                                              counter: counter,
                                              Product_Name: filteredList[index]
                                                  [0],
                                              Number_of_goods: _parseInt(
                                                db.allInOne[index][1],
                                              ),
                                              Barcode_number: _parseInt(
                                                db.allInOne[index][2],
                                              ),
                                              Expiration_date:
                                                  filteredList[index][3],
                                              part: filteredList[index][4],
                                              provisions: _parseDouble(
                                                db.allInOne[index][5],
                                              ),
                                              price: _parseDouble(
                                                db.allInOne[index][6],
                                              ),
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  int _parseInt(String value) {
    try {
      return int.parse(value);
    } catch (e) {
      print("Error parsing integer: $value");
      return 0;
    }
  }

  double _parseDouble(String value) {
    try {
      return double.parse(value);
    } catch (e) {
      print("Error parsing double: $value");
      return 0.0;
    }
  }
}
