import 'package:flutter/material.dart';

import 'custom_text.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    Key? key,
    this.title = '',
    this.hint = "somome@example.com",
    this.obscureText = false,
    required this.onSave,
    required this.validator,
  }) : super(key: key);
  final String title;
  final String hint;
  final FormFieldSetter onSave;
  final FormFieldValidator validator;
  final bool obscureText;
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
          TextFormField(
            obscureText: obscureText,
            onSaved: onSave,
            validator: validator,
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
