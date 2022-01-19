import 'package:aqsat/core/viewmodel/admin/adminProfileViewModel.dart';
import 'package:aqsat/view/admin/editProductDetailView.dart';
import 'package:aqsat/view/admin/usersDetailsView.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilesView extends StatelessWidget {
  const ProfilesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profiles'),
      ),
      body: SingleChildScrollView(
        child: GetBuilder<AdminProfileViewModel>(
          builder: (controller) => ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Material(
              child: Container(
                height: 500,
                child: ListView.builder(
                    itemCount: controller.usersModel.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          controller.getAdress(controller.userModel);
                          Get.to(UsersDetailView(
                              model: controller.usersModel[index]));
                        },
                        child: Container(
                          decoration: BoxDecoration(),
                          height: 70,
                          child: ListTile(
                            title: Text(controller.usersModel[index].name),
                          ),
                        ),
                      );
                    }),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
