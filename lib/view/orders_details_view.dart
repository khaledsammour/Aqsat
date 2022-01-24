import 'package:aqsat/constance.dart';
import 'package:aqsat/core/viewmodel/admin/adminAqsatViewModel.dart';
import 'package:aqsat/core/viewmodel/aqsatViewModel.dart';
import 'package:aqsat/model/buyModel.dart';
import 'package:aqsat/model/user_model.dart';
import 'package:aqsat/view/widget/custom_butoon.dart';
import 'package:aqsat/view/widget/custom_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrdersDetailsView extends StatelessWidget {
  BuyModel model;
  UserModel userModel;
  OrdersDetailsView({required this.model, required this.userModel});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AdminAqsatViewModel>(
      init: AdminAqsatViewModel(),
      builder: (controller) => Scaffold(
        body: Container(
          child: Column(
            children: [
              Container(
                height: 270,
                width: MediaQuery.of(context).size.width,
                child: CachedNetworkImage(
                  imageUrl: model.img,
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
                          title: 'Email:',
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        CustomText(
                          title: userModel.email,
                          fontSize: 18,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        CustomText(
                          title: 'Phone Number:',
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        CustomText(
                          title: userModel.phoneNumber,
                          fontSize: 18,
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
                          title: 'monthly Pay:',
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        CustomText(
                          title: model.monthlyPay,
                          fontSize: 18,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 2.0, left: 10, right: 1),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width * .2 + 20,
                        child: Column(
                          children: [
                            CustomText(
                              title: 'Left',
                              fontSize: 18,
                              color: Colors.grey,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            CustomText(
                              title: model.total + ' JOD',
                              color: primaryColor,
                              fontSize: 18,
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.3 + 10,
                      child: CustomButton(
                        onPressed: () {
                          Get.bottomSheet(Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 250,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(30)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 50,
                                    ),
                                    CustomText(
                                      title: "Confirm Pay Month?",
                                      fontSize: 30,
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    Container(
                                      height: 100,
                                      child: CustomButton(
                                          title: "Confirm",
                                          onPressed: () {
                                            controller.payMoth(
                                                model.buyId,
                                                model.monthlyPay,
                                                model.total,
                                                model.monthLeft);

                                            controller.pendingOrders.clear();
                                            controller.allOrders.clear();
                                            controller.getAllPending();
                                            controller.getAllAqsat();
                                            Get.back();
                                            Get.back();
                                          }),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ));
                        },
                        title: 'Pay ' +
                            double.parse(model.monthlyPay).toStringAsFixed(2),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.3 + 10,
                      padding: EdgeInsets.all(10),
                      child: CustomButton(
                        onPressed: () {
                          Get.bottomSheet(Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 250,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(30)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 50,
                                    ),
                                    CustomText(
                                      title: "Confirm?",
                                      fontSize: 30,
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    Container(
                                      height: 100,
                                      child: CustomButton(
                                          title: "Delete",
                                          color: Colors.red,
                                          onPressed: () {
                                            controller.delete(model.buyId);
                                            controller.pendingOrders.clear();
                                            controller.allOrders.clear();
                                            controller.getAllPending();
                                            controller.getAllAqsat();
                                            Get.back();
                                            Get.back();
                                          }),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ));
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
