// ignore_for_file: unnecessary_null_comparison

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cyc_test/models/user_model.dart';
import 'package:cyc_test/utility/dialog.dart';
import 'package:cyc_test/utility/my_style.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool statusRedEye = true;
  late double screen;
  String? name, user, password;

  Container buildName() {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white70,
        ),
        margin: const EdgeInsets.only(top: 60),
        width: screen * 0.75,
        child: TextField(
          onChanged: (value) => name = value.trim(),
          style: const TextStyle(color: Colors.black),
          decoration: InputDecoration(
            hintStyle: TextStyle(color: MyStyle().darkColor),
            hintText: 'Name',
            prefixIcon: Icon(
              Icons.person_add,
              color: MyStyle().darkColor,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: MyStyle().darkColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: MyStyle().darkColor),
            ),
          ),
        ));
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

  @override
  Widget build(BuildContext context) {
    screen = MediaQuery.of(context).size.width;
    return Scaffold(
      floatingActionButton: buildFloatingActionButton(),
      appBar: AppBar(
        backgroundColor: MyStyle().primaryColor,
        title: const Text('New Register'),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusScopeNode()),
        behavior: HitTestBehavior.opaque,
        child: Center(
          child: Column(
            children: [
              buildName(),
              buildUser(),
              buildPassword(),
            ],
          ),
        ),
      ),
    );
  }

  FloatingActionButton buildFloatingActionButton() {
    return FloatingActionButton(
      backgroundColor: MyStyle().darkColor,
      onPressed: () {
        if ((name?.isEmpty ?? true) ||
            (user?.isEmpty ?? true) ||
            (password?.isEmpty ?? true)) {
          normalDialog(context, 'Have space ? Please Fill');
        } else {
          registerAndFirebase();
        }
      },
      child: const Icon(Icons.cloud_upload_rounded),
    );
  }

  //เชื่อมต่อ Firebase
  Future<void> registerAndFirebase() async {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: user!, password: password!)
        .then((value) async {
      UserModel userModel = UserModel(name: name!);
      print('usermodel => ${userModel.toMap()}');
      print('uid => ${value.user!.uid}');

      await FirebaseFirestore.instance
          .collection('user')
          .doc(value.user!.uid)
          .set(userModel.toMap())
          .then((value) => Navigator.pushNamedAndRemoveUntil(
              context, '/myService', (route) => false));
    }).catchError((value) {
      normalDialog(context, value.message);
    });
  }
}
