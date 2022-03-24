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
              leading: Icon(Icons.confirmation_number),
              title: Text('313455644'),
            ),
            const ListTile(
              leading: Icon(Icons.person_pin_rounded),
              title: Text('Parichat kruetaiw'),
            ),
          ],
        ),
      ),
    );
  }
}
