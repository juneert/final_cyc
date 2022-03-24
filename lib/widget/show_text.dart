import 'package:cyc_test/utility/my_constant.dart';
import 'package:flutter/material.dart';

class ShowText extends StatelessWidget {
  final String label;
  final TextStyle? textStyle;
  const ShowText({
    Key? key,
    required this.label,
    this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(label,style: textStyle ?? Myconstast().h3Style(),);
  }
}
