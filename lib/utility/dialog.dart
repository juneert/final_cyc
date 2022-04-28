import 'package:cyc_test/utility/my_style.dart';
import 'package:flutter/material.dart';

Future<void> normalDialog(BuildContext context, String string) async {
  showDialog(
    context: context,
    builder: (context) => SimpleDialog(
      title: ListTile(
        leading:Image.asset(
          'images/w1.png',
          width: 50,
          height: 50,),
        title: Text(
          'WARNING !!',
          style: MyStyle().redBoldStyle(''),
        ),
        subtitle: Text(string),
      ),
      children: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('OK'),
        ),
      ],
    ),
  );
}