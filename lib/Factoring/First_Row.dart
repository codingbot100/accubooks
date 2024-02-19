import 'package:accubooks/employees/data/database.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';

class FirstRow extends StatefulWidget {
  // Constructor
  FirstRow({Key? key}) : super(key: key);

  @override
  _FirstRowState createState() => _FirstRowState();
}

class _FirstRowState extends State<FirstRow> {
  int numberFactor = 1;
  TimeOfDay currentTime = TimeOfDay.now();
  DateTime now = DateTime.now();
  int dayOfWeek = DateTime.now().weekday;
  List<String> seller = ["احمد سدیس", "محمد کریم", "احمد فواد"];
  late String selectedItem; // Use 'late' to mark it as mutable
  ToDoDatabseEmployees db2 = ToDoDatabseEmployees();
  final _myBox = Hive.box('employees');

  @override
  void initState() {
    super.initState();
    selectedItem = seller.first; // Initialize selectedItem with the first item
    if (_myBox.get("TODOLIST2") == null) {
      db2.createinitialData();
    } else {
      db2.loadData();
    }
  }

  @override
  Widget build(BuildContext context) {
    String dayNameInPersian = getDayNameInPersian(dayOfWeek);

    return Padding(
      padding: EdgeInsets.only(top: 40, right: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            '${currentTime.format(context)} ',
            style: TextStyle(
              fontFamily: 'Yekan',
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          Row(
            children: [
              Text(
                "$dayNameInPersian",
                style: TextStyle(
                  fontFamily: 'Yekan',
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                "  :  " "امروز",
                style: TextStyle(
                  fontFamily: 'Yekan',
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              )
            ],
          ),
          Row(
            children: [
              Text(
                DateFormat("d,MM,yyy").format(DateTime.now()),
                style: TextStyle(
                  fontFamily: 'Yekan',
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                width: 4,
              ),
              Text(
                ": تاریخ امروز",
                style: TextStyle(
                  fontFamily: 'Yekan',
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          SizedBox(
            width: 25,
          ),
          Text(
            " شماره فاکتور:  $numberFactor",
            style: TextStyle(
              fontFamily: 'Yekan',
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            width: 25,
          ),
          DropdownButton<String>(
            value: selectedItem,
            items: (db2.allInOne.isNotEmpty)
                ? (db2.allInOne as List)
                    .map<DropdownMenuItem<String>>((dynamic item) {
                    if (item is List && item.isNotEmpty) {
                      String name = item[
                          0]; // Assuming the name is the first element in the tuple
                      return DropdownMenuItem<String>(
                        value: name,
                        child: Text(name),
                      );
                    }
                    return DropdownMenuItem<String>(
                      value: '',
                      child: Text(''),
                    );
                  }).toList()
                : [],
            onChanged: (String? newValue) {
              setState(() {
                selectedItem = newValue!;
              });
            },
          ),
        ],
      ),
    );
  }

  // Method to get the Persian day name
  String getDayNameInPersian(int dayOfWeek) {
    switch (dayOfWeek) {
      case DateTime.saturday:
        return 'شنبه';
      case DateTime.sunday:
        return 'یک‌شنبه';
      case DateTime.monday:
        return 'دوشنبه';
      case DateTime.tuesday:
        return 'سه‌شنبه';
      case DateTime.wednesday:
        return 'چهارشنبه';
      case DateTime.thursday:
        return 'پنج‌شنبه';
      case DateTime.friday:
        return 'جمعه';
      default:
        return '';
    }
  }
}
