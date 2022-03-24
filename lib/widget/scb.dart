import 'package:cyc_test/utility/my_style.dart';
import 'package:flutter/material.dart';

class SCB extends StatefulWidget {
  const SCB({Key? key}) : super(key: key);

  @override
  _SCBState createState() => _SCBState();
}

class _SCBState extends State<SCB> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyStyle().darkColor,
        title: const Text('SCB Bank'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  height: 160,
                  width: 300,
                  margin: const EdgeInsets.all(16),
                  child: Image.asset(
                    'images/scb.png',
                    // fit: BoxFit.contain,
                  ),
                )
              ],
            ),
            const ListTile(
              leading: Icon(Icons.confirmation_number),
              title: Text('313455644'),
            ),
            const ListTile(
              leading: Icon(Icons.person_pin_rounded),
              title: Text('Parichat kruetiaw'),
            ),
          ],
        ),
      ),
    );
  }
}
