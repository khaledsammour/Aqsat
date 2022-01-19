import 'package:aqsat/view/widget/custom_text.dart';
import 'package:flutter/material.dart';

class CustomButtonSocial extends StatelessWidget {
  const CustomButtonSocial(
      {Key? key,
      required this.title,
      required this.img,
      required this.onpressed})
      : super(key: key);
  final String title;
  final String img;
  final VoidCallback onpressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), color: Colors.grey.shade50),
      child: FlatButton(
          onPressed: onpressed,
          child: Row(
            children: [
              Image.asset('assets/images/$img'),
              SizedBox(
                width: 50,
              ),
              CustomText(
                title: "Sign in with $title",
                alignment: Alignment.center,
              )
            ],
          )),
    );
  }
}
