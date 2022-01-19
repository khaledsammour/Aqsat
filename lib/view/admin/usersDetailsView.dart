import 'package:aqsat/core/viewmodel/admin/adminProfileViewModel.dart';
import 'package:aqsat/model/user_model.dart';
import 'package:aqsat/view/widget/custom_butoon.dart';
import 'package:aqsat/view/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class UsersDetailView extends StatelessWidget {
  UserModel model;
  UsersDetailView({required this.model});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AdminProfileViewModel>(
      builder: (controller) => Scaffold(
        appBar: AppBar(
          title: Text(model.name),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    title: 'Name:',
                  ),
                  CustomText(
                    title: model.name,
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    title: 'Email:',
                  ),
                  CustomText(
                    title: model.email,
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    title: 'Type:',
                  ),
                  CustomText(
                    title: model.type,
                  ),
                ],
              ),
              Container(
                height: 300,
                child: ListView.builder(
                  itemCount: controller.addressModel.length,
                  itemBuilder: (context, index) => Container(
                    padding: EdgeInsets.only(bottom: 30),
                    height: 200,
                    child: GoogleMap(
                      markers: controller.myMarker,
                      initialCameraPosition: CameraPosition(
                          zoom: 9,
                          target: LatLng(
                              double.parse(
                                  controller.addressModel[index].latitude),
                              double.parse(
                                  controller.addressModel[index].longitude))),
                      onMapCreated: (GoogleMapController googleMapController) {
                        controller.onMapCreated(
                            double.parse(
                                controller.addressModel[index].latitude),
                            double.parse(
                                controller.addressModel[index].longitude));
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              CustomButton(
                  title: 'Delete',
                  onPressed: () {
                    controller.deleteUser(model.userId);
                    controller.usersModel.clear();
                    controller.getUsers();
                    Get.back();
                  })
            ],
          ),
        ),
      ),
    );
  }
}
