import 'package:cyc_test/utility/my_style.dart';
import 'package:flutter/material.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({Key? key}) : super(key: key);

  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyStyle().darkColor,
        title: const Text('รายละเอียดการจอง'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.notifications_active_rounded),
            tooltip: 'Show Snackbar',
            onPressed: () {
              Navigator.pushNamed(context, '/HomePage');
            },
          ),
        ],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(0), topRight: Radius.circular(0)),
          color: MyStyle().lightColor,
        ),
        child: Column(
          children: const [
            ListTile(
              leading: Icon(Icons.time_to_leave, color: Colors.black),
              title: Text('ประเภทของรถ',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ),
            ListTile(
              leading:
                  Icon(Icons.arrow_forward_ios_rounded, color: Colors.black),
              title: Text('รถมอเตอร์ไซต์',
                  style: TextStyle(
                    fontSize: 16,
                  )),
            ),
            ListTile(
              leading: Icon(
                Icons.timer,
                color: Colors.black,
              ),
              title: Text('เวลา',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ),
            ListTile(
              leading:
                  Icon(Icons.arrow_forward_ios_rounded, color: Colors.black),
              title: Text('10.00 ',
                  style: TextStyle(
                    fontSize: 16,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
