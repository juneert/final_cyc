import 'package:cyc_test/widget/CalendarPage.dart';
import 'package:cyc_test/widget/authen.dart';
import 'package:cyc_test/widget/my_service.dart';
import 'package:cyc_test/widget/register.dart';
import 'package:flutter/material.dart';

final Map<String, WidgetBuilder> routes = {
  '/authen': (BuildContext context) => Authen(),
  '/register': (BuildContext context) => Register(),
  '/myService': (BuildContext context) => MyService(),
  '/CalendarPage': (BuildContext context) => CalendarPage(),
};
