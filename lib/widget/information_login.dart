import 'package:cyc_test/widget/kbank.dart';
import 'package:cyc_test/widget/kma.dart';
import 'package:cyc_test/widget/qrcode.dart';
import 'package:cyc_test/widget/scb.dart';
import 'package:flutter/material.dart';

class Information extends StatefulWidget {
  const Information({Key? key}) : super(key: key);

  @override
  _InformationState createState() => _InformationState();
}

class _InformationState extends State<Information> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: <Widget>[
        Expanded(
          child: Column(
            children: <Widget>[
              Container(
                height: 1,
                width: double.infinity,
                color: Colors.black12,
              ),
              ListTile(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const SCB()));
                },
                leading: Container(
                  height: 50,
                  width: 50,
                  child: Image.asset('images/scb.png'),
                ),
                title: const Text('SCB'),
                trailing: const Icon(Icons.arrow_forward_ios),
              ),
              Container(
                height: 1,
                width: double.infinity,
                color: Colors.black12,
              ),
              ListTile(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const KPlus()));
                },
                leading: Container(
                  height: 50,
                  width: 50,
                  child: Image.asset('images/k-plus.png'),
                ),
                title: const Text('KBANK'),
                trailing: const Icon(Icons.arrow_forward_ios),
              ),
              Container(
                height: 1,
                width: double.infinity,
                color: Colors.black12,
              ),
              ListTile(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const KMA()));
                },
                leading: Container(
                  height: 40,
                  width: 40,
                  child: Image.asset('images/kma.png'),
                ),
                title: const Text('KRUNGSRI'),
                trailing: const Icon(Icons.arrow_forward_ios),
              ),
              Container(
                height: 1,
                width: double.infinity,
                color: Colors.black12,
              ),
              Container(
                height: 1,
                width: double.infinity,
                color: Colors.black12,
              ),
              ListTile(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const QRCode()));
                },
                leading: Container(
                  height: 40,
                  width: 40,
                  child: Image.asset('images/qr.png'),
                ),
                title: const Text('QR CODE'),
                trailing: const Icon(Icons.arrow_forward_ios),
              ),
              Container(
                height: 1,
                width: double.infinity,
                color: Colors.black12,
              ),
              Container(
                height: 1,
                width: double.infinity,
                color: Colors.black12,
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
