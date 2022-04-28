import 'package:cyc_test/utility/my_style.dart';
import 'package:flutter/material.dart';

class KMA extends StatefulWidget {
  const KMA({Key? key}) : super(key: key);

  @override
  _KMAState createState() => _KMAState();
}

class _KMAState extends State<KMA> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyStyle().darkColor,
        title: const Text('Krungsri Bank'),
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
                    'images/kma.png',
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
              title: Text('857-222584-1'),
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
