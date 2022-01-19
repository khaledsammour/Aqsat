import 'package:aqsat/constance.dart';
import 'package:aqsat/core/viewmodel/admin/adminAqsatViewModel.dart';
import 'package:aqsat/core/viewmodel/aqsatViewModel.dart';
import 'package:aqsat/model/buyModel.dart';
import 'package:aqsat/model/user_model.dart';
import 'package:aqsat/view/control_view.dart';
import 'package:aqsat/view/widget/custom_butoon.dart';
import 'package:aqsat/view/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PendingDetailsView extends StatelessWidget {
  BuyModel model;
  UserModel userModel;
  PendingDetailsView({required this.model, required this.userModel});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AdminAqsatViewModel>(
      builder: (controller) => Scaffold(
        body: Container(
          child: Column(
            children: [
              Container(
                height: 270,
                width: MediaQuery.of(context).size.width,
                child: Image.network(
                  model.img,
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.all(18),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                              title: model.name,
                              fontSize: 26,
                            ),
                            CustomText(
                              title: userModel.name,
                              fontSize: 26,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              height: 60,
                              padding: EdgeInsets.all(16),
                              width: MediaQuery.of(context).size.width * .44,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(color: Colors.grey)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  CustomText(
                                    title: 'price:',
                                  ),
                                  CustomText(
                                    title: model.price,
                                    color: Colors.red,
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 60,
                              padding: EdgeInsets.all(16),
                              width: MediaQuery.of(context).size.width * .44,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(color: Colors.grey)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  CustomText(
                                    title: 'Name:',
                                  ),
                                  CustomText(
                                    title: userModel.name,
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        CustomText(
                          title: 'First Pay:',
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        CustomText(
                          title: model.firstPay,
                          fontSize: 18,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        CustomText(
                          title: 'Phone Number:',
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        CustomText(
                          title: userModel.phoneNumber,
                          fontSize: 18,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        CustomText(
                          title: 'monthly Pay:',
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        CustomText(
                          title:
                              double.parse(model.monthlyPay).toStringAsFixed(2),
                          fontSize: 18,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          padding: EdgeInsets.only(bottom: 30),
                          height: 200,
                          child: GoogleMap(
                            markers: controller.myMarker,
                            initialCameraPosition: CameraPosition(
                                zoom: 9,
                                target: LatLng(double.parse(model.latitude),
                                    double.parse(model.longitude))),
                            onMapCreated:
                                (GoogleMapController googleMapController) {
                              controller.onMapCreated(
                                  double.parse(model.latitude),
                                  double.parse(model.longitude));
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 2.0, left: 10, right: 1),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          CustomText(
                            title: 'PRICE',
                            fontSize: 18,
                            color: Colors.grey,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          CustomText(
                            title: model.price.toString() + " JOD",
                            color: primaryColor,
                            fontSize: 18,
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: 150,
                      padding: EdgeInsets.all(20),
                      height: 100,
                      child: CustomButton(
                        onPressed: () {
                          controller.confirm(
                              model.buyId,
                              double.parse(model.total),
                              double.parse(model.firstPay));
                          controller.pendingOrders.clear();
                          controller.allOrders.clear();
                          controller.getAllPending();
                          controller.getAllAqsat();
                          Get.offAll(ControlView());
                        },
                        title: 'Confirm',
                      ),
                    ),
                    Container(
                      width: 150,
                      padding: EdgeInsets.all(20),
                      height: 100,
                      child: CustomButton(
                        onPressed: () {
                          controller.delete(model.buyId);
                          controller.pendingOrders.clear();
                          controller.allOrders.clear();
                          controller.getAllPending();
                          controller.getAllAqsat();
                          Get.offAll(ControlView());
                        },
                        title: 'Delete',
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
