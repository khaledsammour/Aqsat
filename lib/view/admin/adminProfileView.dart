import 'package:aqsat/constance.dart';
import 'package:aqsat/core/viewmodel/admin/adminProfileViewModel.dart';
import 'package:aqsat/core/viewmodel/profile_viewModel.dart';
import 'package:aqsat/view/admin/addView.dart';

import 'package:aqsat/view/admin/add_view.dart';
import 'package:aqsat/view/account/edit_profileView.dart';
import 'package:aqsat/view/admin/adminProfilesView.dart';
import 'package:aqsat/view/admin/editProductView.dart';
import 'package:aqsat/view/auth/login.dart';
import 'package:aqsat/view/widget/custom_butoon.dart';
import 'package:aqsat/view/widget/custom_listTile.dart';
import 'package:aqsat/view/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminProfileView extends StatelessWidget {
  const AdminProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AdminProfileViewModel>(
        init: AdminProfileViewModel(),
        builder: (controller) => controller.loading.value
            ? CircularProgressIndicator()
            : Scaffold(
                body: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.1,
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.1 + 40,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.3,
                              height:
                                  MediaQuery.of(context).size.height * 0.1 + 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: controller.userModel.pic == "null"
                                  ? GestureDetector(
                                      onTap: () {},
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.grey,
                                          borderRadius:
                                              BorderRadius.circular(100),
                                        ),
                                        child: Icon(Icons.add_a_photo),
                                      ),
                                    )
                                  : Image.network(
                                      controller.userModel.pic,
                                      fit: BoxFit.fill,
                                    ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.6,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  CustomText(
                                    title: controller.userModel.name,
                                    fontSize: 32,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  CustomText(
                                    title: controller.userModel.email,
                                    fontSize: 16,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                          onTap: () {},
                          child: controller.userModel.pic == null
                              ? Container(
                                  height: 60,
                                  width: 250,
                                  decoration: BoxDecoration(
                                    color: Colors.orange,
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(20),
                                    child: CustomText(
                                      title: 'dsda',
                                    ),
                                  ),
                                )
                              : SizedBox(
                                  height: 0,
                                )),
                      SizedBox(
                        height: 50,
                      ),
                      CustomListTile(
                          title: 'Add ',
                          icon: Icon(
                            Icons.add,
                            color: primaryColor,
                          ),
                          onpressed: () {
                            Get.to(Add1View());
                          }),
                      Container(
                        height: 0.8,
                        width: MediaQuery.of(context).size.width - 100,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CustomListTile(
                          title: 'Products',
                          icon: Icon(
                            Icons.production_quantity_limits,
                            color: primaryColor,
                          ),
                          onpressed: () {
                            Get.to(EditProductView());
                          }),
                      Container(
                        height: 0.8,
                        width: MediaQuery.of(context).size.width - 100,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CustomListTile(
                          title: 'Profiles',
                          icon: Icon(
                            Icons.person,
                            color: primaryColor,
                          ),
                          onpressed: () {
                            Get.to(ProfilesView());
                          }),
                      Container(
                        height: 0.8,
                        width: MediaQuery.of(context).size.width - 100,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CustomListTile(
                          title: 'Language',
                          icon: Icon(
                            Icons.language,
                            color: primaryColor,
                          ),
                          onpressed: () {}),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                              title: 'Currency',
                            ),
                            CustomText(
                              title: 'JOD',
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                              title: 'Version',
                            ),
                            CustomText(
                              title: '1.0.0',
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.1,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 70,
                          child: CustomButton(
                              title: 'Sign Out',
                              onPressed: () {
                                controller.signOut();
                                Get.offAll(Login());
                              }),
                        ),
                      ),
                    ],
                  ),
                ),
              ));
  }
}
