import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    Key? key,
    this.title = ' ',
    this.fontSize = 16,
    this.color = Colors.black,
    this.alignment = Alignment.topLeft,
    this.height = 1,
    this.fontWeight = FontWeight.normal,
  }) : super(key: key);
  final String title;
  final double fontSize;
  final Color color;
  final Alignment alignment;
  final double height;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      child: Text(
        title,
        style: TextStyle(
            color: color,
            height: height,
            fontSize: fontSize,
            fontWeight: fontWeight),
      ),
    );
  }
}
