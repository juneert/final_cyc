// ignore_for_file: camel_case_types

import 'package:cyc_test/utility/ColorScheme.dart';
import 'package:cyc_test/utility/my_style.dart';
import 'package:cyc_test/widget/CalendarPage.dart';
// import 'package:cyc_test/widget/typecar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      routes: {
        '/CalendarPage': (context) => const CalendarPage(),
      },
    );
  }
}

class homePage extends StatefulWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  _homePageState createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  Widget currentWidget = const CalendarPage();
  //selectType การเลือกประเภทรถ
  String selectType = "initial";
  // selectedFrequecy เลือกเวลาในการจอง
  String selectedFrequecy = "monthly";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(0), topRight: Radius.circular(0)),
                color: MyStyle().lightColor,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  const Text('ประเภทของรถ',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  const SizedBox(
                    height: 10,
                  ),
                  // #######################################################################################################################
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          changeCleaningType('initial');
                        },
                        child: Column(
                          children: [
                            Container(
                              height: 140,
                              width: MediaQuery.of(context).size.width * 0.43,
                              decoration: const BoxDecoration(
                                color: Color(0xffdfdeff),
                                image: DecorationImage(
                                  image: AssetImage('images/mo.png'),
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              'รถมอเตอร์ไซต์',
                              style: TextStyle(
                                  fontFamily: 'Raleway',
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 30,
                              width: 30,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xffededed),
                              ),
                              child: (selectType == "initial")
                                  ? Icon(
                                      Icons.check_circle,
                                      color: pink,
                                      size: 30,
                                    )
                                  : Container(),
                            )
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          changeCleaningType('upkeep');
                        },
                        child: Column(
                          children: [
                            Container(
                              height: 140,
                              width: MediaQuery.of(context).size.width * 0.43,
                              decoration: const BoxDecoration(
                                color: Color(0xffdfdeff),
                                image: DecorationImage(
                                  image: AssetImage('images/car.png'),
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              'รถยนต์',
                              style: TextStyle(
                                  fontFamily: 'Raleway',
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 30,
                              width: 30,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xffededed),
                              ),
                              child: (selectType == "upkeep")
                                  ? Icon(
                                      Icons.check_circle,
                                      color: pink,
                                      size: 30,
                                    )
                                  : Container(),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  // #######################################################################################################################
                  const SizedBox(
                    height: 20,
                  ),
                  // #######################################################################################################################
                  const Text(
                    'เวลา',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  // #######################################################################################################################
                  const SizedBox(
                    height: 10,
                  ),
                  // #######################################################################################################################
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          changeFrequency("day");
                        },
                        child: Container(
                          height: 50,
                          width: 110,
                          decoration: (selectedFrequecy == "day")
                              ? BoxDecoration(
                                  color: pink,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10)))
                              : BoxDecoration(
                                  border: Border.all(
                                      color: Colors.black.withOpacity(0.3)),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10))),
                          child: Center(
                            child: Text(
                              '08:00 ',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: (selectedFrequecy == "day")
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          changeFrequency("weekly");
                        },
                        child: Container(
                          height: 50,
                          width: 110,
                          decoration: (selectedFrequecy == "weekly")
                              ? BoxDecoration(
                                  color: pink,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10)))
                              : BoxDecoration(
                                  border: Border.all(
                                      color: Colors.black.withOpacity(0.3)),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10))),
                          child: Center(
                            child: Text(
                              '09:00',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: (selectedFrequecy == "weekly")
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          changeFrequency("monthly");
                        },
                        child: Container(
                          height: 50,
                          width: 110,
                          decoration: (selectedFrequecy == "monthly")
                              ? BoxDecoration(
                                  color: pink,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10)))
                              : BoxDecoration(
                                  border: Border.all(
                                      color: Colors.black.withOpacity(0.3)),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10))),
                          child: Center(
                            child: Text(
                              '10:00',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: (selectedFrequecy == "monthly")
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  // #######################################################################################################################
                  const SizedBox(
                    height: 10,
                  ),
                  // #######################################################################################################################
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          changeFrequency("t1");
                        },
                        child: Container(
                          height: 50,
                          width: 110,
                          decoration: (selectedFrequecy == "t1")
                              ? BoxDecoration(
                                  color: pink,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10)))
                              : BoxDecoration(
                                  border: Border.all(
                                      color: Colors.black.withOpacity(0.3)),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10))),
                          child: Center(
                            child: Text(
                              '11:00',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: (selectedFrequecy == "t1")
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          changeFrequency("t2");
                        },
                        child: Container(
                          height: 50,
                          width: 110,
                          decoration: (selectedFrequecy == "t2")
                              ? BoxDecoration(
                                  color: pink,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10)))
                              : BoxDecoration(
                                  border: Border.all(
                                      color: Colors.black.withOpacity(0.3)),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10))),
                          child: Center(
                            child: Text(
                              '12:00',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: (selectedFrequecy == "t3")
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          changeFrequency("t4");
                        },
                        child: Container(
                          height: 50,
                          width: 110,
                          decoration: (selectedFrequecy == "t4")
                              ? BoxDecoration(
                                  color: pink,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10)))
                              : BoxDecoration(
                                  border: Border.all(
                                      color: Colors.black.withOpacity(0.3)),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10))),
                          child: Center(
                            child: Text(
                              '13:00',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: (selectedFrequecy == "t4")
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  // #######################################################################################################################
                  const SizedBox(
                    height: 10,
                  ),
                  // #######################################################################################################################
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          changeFrequency("t5");
                        },
                        child: Container(
                          height: 50,
                          width: 110,
                          decoration: (selectedFrequecy == "t5")
                              ? BoxDecoration(
                                  color: pink,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10)))
                              : BoxDecoration(
                                  border: Border.all(
                                      color: Colors.black.withOpacity(0.3)),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10))),
                          child: Center(
                            child: Text(
                              '14:00',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: (selectedFrequecy == "t5")
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          changeFrequency("t6");
                        },
                        child: Container(
                          height: 50,
                          width: 110,
                          decoration: (selectedFrequecy == "t6")
                              ? BoxDecoration(
                                  color: pink,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10)))
                              : BoxDecoration(
                                  border: Border.all(
                                      color: Colors.black.withOpacity(0.3)),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10))),
                          child: Center(
                            child: Text(
                              '15:00',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: (selectedFrequecy == "t6")
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          changeFrequency("t7");
                        },
                        child: Container(
                          height: 50,
                          width: 110,
                          decoration: (selectedFrequecy == "t7")
                              ? BoxDecoration(
                                  color: pink,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10)))
                              : BoxDecoration(
                                  border: Border.all(
                                      color: Colors.black.withOpacity(0.3)),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10))),
                          child: Center(
                            child: Text(
                              '16:00',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: (selectedFrequecy == "t7")
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  // #######################################################################################################################
                  const SizedBox(
                    height: 10,
                  ),
                  // #######################################################################################################################
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          changeFrequency("t8");
                        },
                        child: Container(
                          height: 50,
                          width: 110,
                          decoration: (selectedFrequecy == "t8")
                              ? BoxDecoration(
                                  color: pink,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10)))
                              : BoxDecoration(
                                  border: Border.all(
                                      color: Colors.black.withOpacity(0.3)),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10))),
                          child: Center(
                            child: Text(
                              '17:00',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: (selectedFrequecy == "t8")
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          changeFrequency("t9");
                        },
                        child: Container(
                          height: 50,
                          width: 110,
                          decoration: (selectedFrequecy == "t9")
                              ? BoxDecoration(
                                  color: pink,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10)))
                              : BoxDecoration(
                                  border: Border.all(
                                      color: Colors.black.withOpacity(0.3)),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10))),
                          child: Center(
                            child: Text(
                              '18:00',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: (selectedFrequecy == "t9")
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          changeFrequency("t10");
                        },
                        child: Container(
                          height: 50,
                          width: 110,
                          decoration: (selectedFrequecy == "t10")
                              ? BoxDecoration(
                                  color: pink,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10)))
                              : BoxDecoration(
                                  border: Border.all(
                                      color: Colors.black.withOpacity(0.3)),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10))),
                          child: Center(
                            child: Text(
                              '19:30',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: (selectedFrequecy == "t10")
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  // #######################################################################################################################
                  const SizedBox(
                    height: 30,
                  ),
                  // #######################################################################################################################
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: openCalendarPage,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 60, vertical: 15),
                          decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              color: darkColor),
                          child: const Text(
                            "ทำการจอง",
                            style: TextStyle(
                                fontSize: 19,
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      )
                    ],
                  )
                  // #######################################################################################################################
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  void changeCleaningType(String type) {
    selectType = type;
    setState(() {});
  }

  void changeFrequency(String frequency) {
    selectedFrequecy = frequency;
    setState(() {});
  }

  void openCalendarPage() {
    Navigator.pushNamed(context, '/CalendarPage');
  }
}
