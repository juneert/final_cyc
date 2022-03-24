import 'package:cyc_test/utility/my_constant.dart';
import 'package:flutter/material.dart';

class ShowImage extends StatelessWidget {
  final double? width;
  final String pathImage;
  const ShowImage({
    Key? key,
    this.width,
    required this.pathImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical:16),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Myconstast.bgColor,
      ),
      width: width ?? 200,
      child: Image.asset(pathImage),
    );
  }
}
