import 'package:cyc_test/utility/my_style.dart';
import 'package:flutter/material.dart';

class KPlus extends StatefulWidget {
  const KPlus({Key? key}) : super(key: key);

  @override
  _KPlusState createState() => _KPlusState();
}

class _KPlusState extends State<KPlus> {
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyStyle().darkColor,
        title: const Text('Kasikorn Bank'),
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
                    'images/k-plus.png',
                    // fit: BoxFit.contain,
                  ),
                )
              ],
            ),
           const ListTile(
              leading: Text(
                'เลขบัญชี :',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 243, 0, 0),
                ),
              ),
              title: Text('092-3-45212-5'),
            ),
            const ListTile(
              leading: Text(
                'ชื่อบัญชี : ',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 243, 0, 0),
                ),
              ),
              title: Text('ปาริชาติ เครือเตียว'),
            ),
          ],
        ),
      ),
    );
  }
}
