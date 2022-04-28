import 'package:cyc_test/utility/my_style.dart';
import 'package:flutter/material.dart';

class QRCode extends StatefulWidget {
  const QRCode({Key? key}) : super(key: key);

  @override
  _QRCodeState createState() => _QRCodeState();
}

class _QRCodeState extends State<QRCode> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyStyle().darkColor,
        title: const Text('QR Code'),
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
                    'images/qr.png',
                    // fit: BoxFit.contain,
                  ),
                )
              ],
            ),
           const ListTile(
              leading: Text(
                'พร้อมเพย์ :',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 243, 0, 0),
                ),
              ),
              title: Text('095-073-7939'),
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
