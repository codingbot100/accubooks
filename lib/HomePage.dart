// ignore_for_file: must_be_immutable

import 'dart:io';

import 'package:accubooks/Factoring/Home_Factoring.dart';
import 'package:accubooks/backfactor.dart/Home_backFactor.dart';
import 'package:accubooks/employees/Ware_Home.dart';
import 'package:accubooks/rep/Home_rep.dart';
import 'package:accubooks/widgets/imageData.dart';
import 'package:accubooks/widgets/save_Name.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../whouse2.dart/Ware_Home.dart';
import 'package:accubooks/widgets/NavigationSideBar.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late String _loadedInfo;
  List<Widget> iconsList = [
    Icon(Icons.shopping_cart, size: 30),
    Icon(Icons.attach_money, size: 30),
    FaIcon(
      FontAwesomeIcons.users,
      size: 30,
    ),
    Icon(Icons.analytics, size: 30),
    Icon(Icons.analytics, size: 30),
  ];
  int _selectedindex = 0;
  File? _image2;

  @override
  void initState() {
    super.initState();
    loadImage();
    _loadInfo().then((loadedInfo) {
      setState(() {
        _loadedInfo = loadedInfo ?? '';
      });
    });
  }

  bool isDark = false;

  Future<void> loadImage() async {
    final String? imagePath = await ImageHandler.getSavedImagePath();
    if (imagePath != null) {
      setState(() {
        _image2 = File(imagePath);
      });
    }
  }

  Future<void> _pickAndSaveImage() async {
    final File? pickedImage = await ImageHandler.pickAndSaveImage();
    if (pickedImage != null) {
      setState(() {
        _image2 = pickedImage;
      });
    }
  }

  Future<void> _showInformationDialog(
    BuildContext context,
  ) async {
    TextEditingController _infoController = TextEditingController();

    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return Container(
          child: Column(
            children: [
              Icon(Icons.store),
              Padding(
                padding: const EdgeInsets.only(top: 100),
                child: AlertDialog(
                  title: Center(
                      child: Text(
                    'نام فروشگاه',
                    style: TextStyle(
                        fontFamily: 'Yekan',
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.w900),
                  )),
                  content: Column(
                    children: [
                      TextField(
                        textDirection: TextDirection.rtl,
                        textAlign: TextAlign.center,
                        controller: _infoController,
                        decoration: InputDecoration(
                          hintText: 'تنها   نام   فروشگاه',
                          hintStyle: TextStyle(
                              letterSpacing: 0.5,
                              fontFamily: 'Yekan',
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w900),
                        ),
                      ),
                      SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            onPressed: () async {
                              String info = _infoController.text;
                              await StorageService.saveInfo(info);
                              _loadInfo(); // Moved _loadInfo here
                              Navigator.pop(context); // Close the dialog
                            },
                            child: Text('ذخیره'),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context); // Close the dialog
                            },
                            child: Text('لغو'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Future<String?> _loadInfo() async {
    String? info = await StorageService.loadInfo();
    return info;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              padding: EdgeInsets.only(
                  top: 3, left: 3, right: 3, bottom: 3), // Set padding to zero

              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(178, 121, 93, 93).withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: Offset(0, 1), // changes position of shadow
                ),
              ]),
              child: Center(
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        child: _image2 != null
                            ? Image.file(_image2!, fit: BoxFit.cover)
                            : Text('No image selected'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 120, left: 235),
                      child: IconButton(
                        onPressed: _pickAndSaveImage,
                        tooltip: 'Pick Image',
                        icon: Icon(
                          Icons.add_a_photo,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('نام'),
              onTap: () {
                _showInformationDialog(context);
              },
            ),
            ListTile(
              leading: GestureDetector(
                  onTap: () {
                    setState(() {
                      isDark = !isDark;
                    });
                  },
                  child: Icon(Icons.settings)),
              title: Icon(isDark ? Icons.wb_sunny : Icons.nights_stay_rounded),
              onTap: () {
                // Handle the tap on Settings
                // Navigator.pop(context); // Close the drawer
              },
            ),
            // Add more ListTiles for additional menu items
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
            // right: 10
            ),
        child: Column(
          children: [
            Container(
              child: Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Container(
                        child: Center(
                            child: _selectedindex == 0
                                ? Home_rep()
                                : _selectedindex == 1
                                    ? Home_Factoring()
                                    : _selectedindex == 2
                                        ? employees()
                                        : _selectedindex == 3
                                            ? Home_Page()
                                            : _selectedindex == 4
                                                ? saved_home_factor12()
                                                : saved_home_factor12()),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 160),
                        AnimatedSmoothIndicator(
                          duration: Duration(milliseconds: 500),
                          axisDirection: Axis.vertical,
                          activeIndex: _selectedindex,
                          count: 5,
                          effect: WormEffect(
                            spacing: 25,
                            radius: 4,
                            dotWidth: 26,
                            dotHeight: 3,
                            paintStyle: PaintingStyle.fill,
                            strokeWidth: 1.5,
                            dotColor: Colors.transparent,
                            activeDotColor: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          // right: 30
                          ),
                      child: Row(children: [
                        Container(
                          width: 220,
                          child: NavigationSidebar(
                            itemsIcons: iconsList,
                            items: [
                              ' گزارشات ',
                              ' فروشات',
                              ' کارمندان',
                              ' محصولات',
                              'فاکتور ها  '
                            ],
                            selectedIndex: _selectedindex,
                            onItemSelected: (index) {
                              setState(() {
                                _selectedindex = index;
                              });
                              switch (_selectedindex) {
                                case 0:
                                  break;
                                case 1:
                                  break;
                                case 2:
                                  break;
                                case 3:
                                  break;
                                case 4:
                                  break;
                              }
                            },
                          ),
                        ),
                      ]),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Container(
            width: 300,
            height: 300,
            child: AlertDialog(
              title: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Container(
                      height: 200,
                      width: 200,
                      child: Center(
                        child: Text(
                          "نام فروشگاه خود را وارد کنید",
                          style: TextStyle(
                              fontFamily: 'Yekan',
                              color: Colors.black,
                              fontSize: 30,
                              fontWeight: FontWeight.w900),
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                        child: TextField(
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
                              borderRadius: BorderRadius.circular(10.0))),
                    )),
                  )
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
                              Navigator.of(context).pop();
                            });
                          },
                          child: Text(
                            "  ذخیره کردن ",
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
            ),
          );
        });
  }
}
