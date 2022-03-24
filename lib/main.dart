import 'package:cyc_test/widget/router.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

late String initiaRoute = '/authen'; //เมื่อเป็น null จะทำตรงนี้เลย

Future<Null> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) async {
    await FirebaseAuth.instance.authStateChanges().listen((event) {
      //ถาไม่ได้ Login //เมื่อเป็น ไม่เท่ากับ null จะทำตรงนี้เลย
      if (event != null) {
        initiaRoute = '/myService';
      }
      runApp(MyApp());
    });
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: routes,
      initialRoute: initiaRoute,
    );
  }
}
