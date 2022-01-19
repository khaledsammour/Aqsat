import 'package:flutter/material.dart';

import 'custom_text.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.title,
    required this.hint,
    required this.onchange,
  }) : super(key: key);
  final String title;
  final String hint;
  final Function(String) onchange;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          CustomText(
            title: title,
            fontSize: 14,
            color: Colors.grey.shade900,
          ),
          TextField(
            onChanged: onchange,
            decoration: InputDecoration(
                hintText: hint,
                hintStyle: TextStyle(
                  color: Colors.grey,
                ),
                fillColor: Colors.white),
          ),
        ],
      ),
    );
  }
}
