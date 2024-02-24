import 'package:accubooks/Factoring/Home_Factoring.dart';
import 'package:accubooks/backfactor.dart/Home_backFactor.dart';
import 'package:accubooks/employees/Ware_Home.dart';
import 'package:accubooks/rep/Home_rep.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../whouse2.dart/Ware_Home.dart';
import 'package:accubooks/widgets/NavigationSideBar.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
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
                                        : _selectedindex == 3
                                            ? Home_rep()
                                            : _selectedindex == 4
                                                ? home_backFactor()
                                                : home_backFactor()),
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
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(height: 70),
                            AnimatedSmoothIndicator(
                              duration: Duration(milliseconds: 500),
                              axisDirection: Axis.vertical,
                              activeIndex: _selectedindex,
                              count: 5,
                              effect: WormEffect(
                                spacing: 24,
                                radius: 4,
                                dotWidth: 25,
                                dotHeight: 3,
                                paintStyle: PaintingStyle.fill,
                                strokeWidth: 1.5,
                                dotColor: Colors.transparent,
                                activeDotColor: Colors.black,
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
