import 'package:flutter/material.dart';

class Home_Factoring extends StatefulWidget {
  const Home_Factoring({super.key});

  @override
  State<Home_Factoring> createState() => _Home_FactoringState();
}

class _Home_FactoringState extends State<Home_Factoring> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:
            const EdgeInsets.only(left: 25, right: 25, top: 50, bottom: 45),
        child: Expanded(
          child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Color.fromRGBO(247, 247, 247, 1),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Center(
                      child: Text(
                        "فروشگاه مواد غذایی تک",
                        style: TextStyle(
                            fontSize: 30,
                            fontFamily: 'Yekan',
                            fontWeight: FontWeight.w900),
                      ),
                    ),
                  ),
                  Row()

                ],
              )),
        ),
      ),
    );
  }
}
