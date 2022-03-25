import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cyc_test/models/time_service_model.dart';
import 'package:cyc_test/utility/dialog.dart';
import 'package:cyc_test/utility/my_constant.dart';
import 'package:cyc_test/widget/show_image.dart';
import 'package:cyc_test/widget/show_text.dart';
import 'package:cyc_test/widget/showchoosetime.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
//import 'package:flutter/rendering.dart';

class ShowTimeAndType extends StatefulWidget {
  const ShowTimeAndType({
    Key? key,
  }) : super(key: key);

  @override
  State<ShowTimeAndType> createState() => _ShowTimeAndTypeState();
}

class _ShowTimeAndTypeState extends State<ShowTimeAndType> {
  int indexWidget = 0;
  DateTime? dateTime;
  String? dateTimeStr;
  var listTimeService = <List<String>>[];

  @override
  void initState() {
    super.initState();
    dateTime = DateTime.now();
    changeDateToString();

    readOrCreateTimeService();

    listTimeService.add(Myconstast.timeServiceMotos);
    listTimeService.add(Myconstast.timeServiceCars);
  }

  Future<void> readOrCreateTimeService() async {
    await FirebaseFirestore.instance
        .collection('timeService')
        .doc(dateTimeStr)
        .get()
        .then((value) async {
      print('value read timeService ==>> at $dateTimeStr == ${value.data()}');
      if (value.data() == null) {
        var carServices = <String>[];
        for (var item in Myconstast.timeServiceCars) {
          carServices.add('');
        }

        var motoServices = <String>[];
        for (var item in Myconstast.timeServiceMotos) {
          motoServices.add('');
        }

        TimeServiceModel timeServiceModel = TimeServiceModel(
            carService: carServices,
            motoService: motoServices,
            workdate: Timestamp.fromDate(dateTime!));

        await FirebaseFirestore.instance
            .collection('timeService')
            .doc(dateTimeStr)
            .set(timeServiceModel.toMap())
            .then((value) {
          print('Add Doc $dateTimeStr Success');
        });
      } else {
        print('Have doc => $dateTimeStr');
      }
    });
  }

  void changeDateToString() {
    DateFormat dateFormat = DateFormat('dd-MMM-yyyy');
    dateTimeStr = dateFormat.format(dateTime!);
    print('dateTimeStr ==>> $dateTimeStr');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constaraints) {
        return SingleChildScrollView(
          child: Column(
            children: [
              newTitle('ประเภทของรถ'),
              newImage(constaraints),
              newSubTitle(),
              newRadioGroup(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      print(
                          'diff ลดวัน ${dateTime!.difference(DateTime.now()).inDays}');
                      if (dateTime!.difference(DateTime.now()).inDays <= 0) {
                        setState(() {
                          dateTime = DateTime.now();
                        });
                        changeDateToString();
                        normalDialog(context,
                            'ไม่สามารถย้อนกลับไปวันที่ ณ ที่ผ่านมาแล้ว');
                      } else {
                        setState(() {
                          dateTime = DateTime.utc(
                            dateTime!.year,
                            dateTime!.month,
                            dateTime!.day - 1,
                          );
                          changeDateToString();
                        });
                      }
                    },
                    icon: const Icon(Icons.arrow_back),
                  ),
                  newTitle(dateTimeStr!),
                  IconButton(
                    onPressed: () {
                      print(
                          'diff เพิ่มวัน ${dateTime!.difference(DateTime.now()).inDays}');
                      if (dateTime!.difference(DateTime.now()).inDays >= 7) {
                        normalDialog(
                            context, 'ไม่สามารถ จองล่วงหน้าเกิน 7 วัน');
                      } else {
                        setState(() {
                          dateTime = DateTime.utc(
                            dateTime!.year,
                            dateTime!.month,
                            dateTime!.day + 1,
                          );
                          changeDateToString();
                        });
                      }
                    },
                    icon: const Icon(Icons.arrow_forward),
                  )
                ],
              ),
              newChooseTimeService(),
              newReserve(constaraints)
            ],
          ),
        );
      }),
    );
  }

  SizedBox newReserve(BoxConstraints constaraints) {
    return SizedBox(
      width: constaraints.maxWidth,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(primary: Myconstast.darkColor),
        onPressed: () {},
        child: const Text('ทำการจอง'),
      ),
    );
  }

  Widget newChooseTimeService() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        itemCount: listTimeService[indexWidget].length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          mainAxisExtent: 60,
        ),
        itemBuilder: (context, index) => Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(),
            borderRadius: BorderRadius.circular(15),
          ),
          child: ShowText(
            label: listTimeService[indexWidget][index],
            textStyle: Myconstast().h2Style(),
          ),
        ),
      ),
    );
  }

  Row newRadioGroup() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Radio(
            value: 0,
            groupValue: indexWidget,
            onChanged: (value) {
              setState(() {
                indexWidget = int.parse(value.toString());
              });
            }),
        Radio(
            value: 1,
            groupValue: indexWidget,
            onChanged: (value) {
              setState(() {
                indexWidget = int.parse(value.toString());
              });
            }),
      ],
    );
  }

  Row newSubTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ShowText(
          label: 'รถมอเตอร์ไซต์',
          textStyle: Myconstast().h2Style(),
        ),
        ShowText(
          label: 'รถยนต์',
          textStyle: Myconstast().h2Style(),
        ),
      ],
    );
  }

  Row newImage(BoxConstraints constaraints) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ShowImage(
          pathImage: 'images/mo.png',
          width: constaraints.maxWidth * 0.5 - 32,
        ),
        ShowImage(
          pathImage: 'images/car.png',
          width: constaraints.maxWidth * 0.5 - 32,
        )
      ],
    );
  }

  Row newTitle(String label) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16, top: 16),
          child: ShowText(
            label: label,
            textStyle: Myconstast().h2Style(),
          ),
        ),
      ],
    );
  }
}
