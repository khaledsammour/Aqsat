import 'package:aqsat/model/user_model.dart';
import 'package:aqsat/view/widget/custom_text.dart';
import 'package:flutter/material.dart';

class EditProfileView extends StatelessWidget {
  UserModel userModel;
  EditProfileView({required this.userModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            _editWidget('Name:', userModel.name),
            SizedBox(
              height: 20,
            ),
            _editWidget('Email:', userModel.email),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}

Widget _editWidget(String title, value) {
  return GestureDetector(
    onTap: () {},
    child: Container(
      color: Colors.white,
      height: 50,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 10,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(
              title: title,
            ),
            CustomText(
              title: value,
            ),
          ],
        ),
      ),
    ),
  );
}
