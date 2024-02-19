import 'package:accubooks/Factoring/Home_Factoring.dart';
import 'package:accubooks/Factoring/prac/pr.dart';
import 'package:accubooks/employees/Ware_Home.dart';
import '../whouse2.dart/Ware_Home.dart';
import 'package:accubooks/widgets/NavigationSideBar.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> iconsList = [
    Icon(Iconsax.document),
    Icon(
      Icons.warehouse,
    ),
    Icon(Icons.receipt),
    Icon(Icons.settings),
  ];
  int _selectedindex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(247, 247, 247, 1),
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: ListTile(
              title: Text("حدید نرم افزار"),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(right: 10),
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
                              ? Home_Page()
                              : _selectedindex == 1
                                  ? Home_Factoring()
                                  : _selectedindex == 2
                                      ? employees()
                                      : InvoiceScreen(),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 30),
                      child: Row(children: [
                        Container(
                          width: 220,
                          child: NavigationSidebar(
                            itemsIcons: iconsList,
                            items: [
                              ' محصولات',
                              ' فروشات',
                              ' کارمندان',
                              ' گزارشات ',
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
                              }
                            },
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(height: 40),
                            AnimatedSmoothIndicator(
                              duration: Duration(milliseconds: 400),
                              axisDirection: Axis.vertical,
                              activeIndex: _selectedindex,
                              count: 4,
                              effect: WormEffect(
                                spacing: 24,
                                radius: 4,
                                dotWidth: 15,
                                dotHeight: 2,
                                paintStyle: PaintingStyle.fill,
                                strokeWidth: 1.5,
                                dotColor: Colors.transparent,
                                activeDotColor: Colors.lightBlue,
                              ),
                            ),
                          ],
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
}

class PageOneContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Main Content for Page One'),
    );
  }
}

class PageTwoContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Main Content for Page Two',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}

///

