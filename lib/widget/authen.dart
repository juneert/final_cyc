import 'package:cyc_test/utility/dialog.dart';
import 'package:cyc_test/utility/my_style.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Authen extends StatefulWidget {
  @override
  _AuthenState createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
  late double screen;
  bool statusRedEye = true;
  late String user, password;

  @override
  Widget build(BuildContext context) {
    screen = MediaQuery.of(context).size.width;
    if (kDebugMode) {
      print('screen =$screen');
    }
    return Scaffold(
      floatingActionButton: buildRegister(),
      body: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            center: const Alignment(0, -33),
            radius: 1.0,
            colors: <Color>[Colors.white, MyStyle().primaryColor],
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                buildLogo(),
                MyStyle().titleH1('Car Your Care'),
                buildUser(),
                buildPassword(),
                buildLogin(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  TextButton buildRegister() => TextButton(
        onPressed: () => Navigator.pushNamed(context, '/register'),
        child: const Text(
          'New Register',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      );

  Container buildLogin() {
    return Container(
      width: screen * 0.75,
      height: 45,
      margin: const EdgeInsets.only(top: 16),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: MyStyle().darkColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: () {
          checkAuthen();
        },
        child: const Text('Login'),
      ),
    );
  }

  Container buildUser() {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white70,
        ),
        margin: const EdgeInsets.only(top: 16),
        width: screen * 0.75,
        child: TextField(
          keyboardType: TextInputType.emailAddress,
          onChanged: (value) => user = value.trim(),
          style: const TextStyle(color: Colors.black),
          decoration: InputDecoration(
            hintStyle: TextStyle(color: MyStyle().darkColor),
            hintText: 'User',
            prefixIcon: Icon(
              Icons.perm_identity,
              color: MyStyle().darkColor,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: MyStyle().darkColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: MyStyle().lightColor),
            ),
          ),
        ));
  }

  Container buildPassword() {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white70,
        ),
        margin: const EdgeInsets.only(top: 16),
        width: screen * 0.75,
        child: TextField(
          onChanged: (value) => password = value.trim(),
          obscureText: statusRedEye,
          decoration: InputDecoration(
            suffixIcon: IconButton(
              icon: statusRedEye
                  ? const Icon(Icons.remove_red_eye)
                  : const Icon(Icons.remove_red_eye_outlined),
              onPressed: () {
                setState(() {
                  statusRedEye = !statusRedEye;
                });
                if (kDebugMode) {
                  print('statusRedEye =$statusRedEye');
                }
              },
            ),
            hintStyle: TextStyle(color: MyStyle().darkColor),
            hintText: 'Password',
            prefixIcon: Icon(
              Icons.lock_outline,
              color: MyStyle().darkColor,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: MyStyle().darkColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: MyStyle().lightColor),
            ),
          ),
        ));
  }

  Container buildLogo() {
    return Container(
      width: screen * 0.4,
      child: MyStyle().showLogo(),
    );
  }

  Future<void> checkAuthen() async {
    await Firebase.initializeApp().then((value) async {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: user, password: password)
          .then((value) => Navigator.pushNamedAndRemoveUntil(
              context, '/myService', (route) => false))
          // ignore: invalid_return_type_for_catch_error
          .catchError((value) => normalDialog(context, value.message));
    });
  }
}
