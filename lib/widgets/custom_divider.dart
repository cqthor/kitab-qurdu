import 'package:flutter/material.dart';
import 'package:kitab_qurdu/color.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    Key? key,
    required this.width,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1,
      width: width,
      color: kSearchColor,
    );
  }
}
