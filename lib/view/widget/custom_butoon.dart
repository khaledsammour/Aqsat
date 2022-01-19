import 'package:aqsat/constance.dart';
import 'package:aqsat/view/widget/custom_text.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {Key? key,
      this.color = primaryColor,
      required this.title,
      required this.onPressed})
      : super(key: key);
  final String title;
  final VoidCallback onPressed;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
        onPressed: onPressed,
        padding: EdgeInsets.all(18),
        color: color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: CustomText(
          title: title,
          alignment: Alignment.center,
          color: Colors.white,
        ));
  }
}
