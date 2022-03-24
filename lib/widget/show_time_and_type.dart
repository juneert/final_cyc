import 'package:cyc_test/utility/my_constant.dart';
import 'package:cyc_test/widget/show_image.dart';
import 'package:cyc_test/widget/show_text.dart';
import 'package:cyc_test/widget/showchoosetime.dart';
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
    DateFormat dateFormat = DateFormat('dd-MMM-yyyy');
    dateTimeStr = dateFormat.format(dateTime!);
    listTimeService.add(Myconstast.timeServiceMotos);
    listTimeService.add(Myconstast.timeServiceCars);
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
              newTitle(dateTimeStr!),
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
              border: Border.all(), borderRadius: BorderRadius.circular(15),),
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
