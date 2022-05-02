import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cyc_test/models/receive_admin.dart';
import 'package:cyc_test/utility/my_constant.dart';
import 'package:cyc_test/widget/show_text.dart';
import 'package:cyc_test/widget/showpress.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Show_receive_admin extends StatefulWidget {
  const Show_receive_admin({
    Key? key,
  }) : super(key: key);

  @override
  State<Show_receive_admin> createState() => _Show_receive_adminState();
}

class _Show_receive_adminState extends State<Show_receive_admin> {
  bool load = true;
  bool? haveReceive;
  var receiveAdmins = <ReceiveAdmin>[];

  @override
  void initState() {
    super.initState();
    readReceiveAdmin();
  }

  Future<void> readReceiveAdmin() async {
    var user = FirebaseAuth.instance.currentUser;
    await FirebaseFirestore.instance
        .collection('user')
        .doc(user!.uid)
        .collection('receive')
        .get()
        .then((value) {
      load = false;
      if (value.docs.isEmpty) {
        haveReceive = false;
      } else {
        haveReceive = true;
        for (var item in value.docs) {
          ReceiveAdmin receiveAdmin = ReceiveAdmin.fromMap(item.data());
          receiveAdmins.add(receiveAdmin);
        }
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: load
          ? const ShowProgress()
          : haveReceive!
              ? ListView.builder(
                  itemCount: receiveAdmins.length,
                  itemBuilder: (context, index) => Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ShowText(
                                label: receiveAdmins[index].carId,
                                textStyle: Myconstast().h2Style(),
                              ),
                              ShowText(label: 'Phone : ${receiveAdmins[index].phone}')
                            ],
                          ),
                          ShowText(
                            label: receiveAdmins[index].province,
                            textStyle: Myconstast().h2blueStyle(),
                          ),
                          ShowText(
                            label: changeTimeToStr(
                                receiveAdmins[index].timeService),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              : Center(
                  child: ShowText(
                    label: 'ยังไม่การจองของวันนี้เกิดขึ้น',
                    textStyle: Myconstast().h1Style(),
                  ),
                ),
    );
  }

  String changeTimeToStr(Timestamp timeService) {
    DateFormat dateFormat = DateFormat('dd-MMM-yyyy HH:mm');
    String string = dateFormat.format(timeService.toDate());
    string = 'เวลาการล้างรถ $string';
    return string;
  }
}
