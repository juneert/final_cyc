import 'package:flutter/material.dart';

class ShowChooseTime extends StatefulWidget {
  final int indexWidget;
  final DateTime dateTime;
  const ShowChooseTime({
    Key? key,
    required this.indexWidget,
    required this.dateTime,
  }) : super(key: key);

  @override
  State<ShowChooseTime> createState() => _ShowChooseTimeState();
}

class _ShowChooseTimeState extends State<ShowChooseTime> {
  int? indexWidget;
  DateTime? dateTime;

  @override
  void initState() {
    super.initState();
    indexWidget = widget.indexWidget;
    dateTime = widget.dateTime;
  }

  @override
  Widget build(BuildContext context) {
    return Text('indexWidget ==>> $indexWidget');
  }
}
