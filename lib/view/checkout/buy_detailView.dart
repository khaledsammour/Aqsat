import 'package:aqsat/core/viewmodel/aqsatViewModel.dart';
import 'package:aqsat/model/buyModel.dart';
import 'package:aqsat/view/aqsat_view.dart';
import 'package:aqsat/view/control_view.dart';
import 'package:aqsat/view/widget/custom_butoon.dart';
import 'package:aqsat/view/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constance.dart';

class BuyDetailView extends StatelessWidget {
  BuyModel model;
  BuyDetailView({required this.model});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: primaryColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  height: 250,
                  color: primaryColor,
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      children: [
                        CustomText(
                          title: model.name,
                          color: Colors.white,
                          fontSize: 40,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Column(
                          children: [
                            CustomText(
                              title: 'Cpu',
                              color: Colors.white54,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            CustomText(
                              title: 'core i4',
                              color: Colors.white54,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            CustomText(
                              title: 'Ram',
                              color: Colors.white54,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            CustomText(
                              title: '12 GB',
                              color: Colors.white54,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            CustomText(
                              title: 'storage',
                              color: Colors.white54,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            CustomText(
                              title: '500 GB',
                              color: Colors.white54,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height - 150,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30))),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        CustomText(
                          title: 'Aqsat',
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                              title: 'First pay:',
                            ),
                            CustomText(
                              title: model.firstPay + ' JOD',
                              color: priceColor,
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                              title: 'monthly pay:',
                            ),
                            CustomText(
                              title: model.monthlyPay + ' JOD',
                              color: priceColor,
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                              title: 'Time Left:',
                            ),
                            CustomText(
                              title: model.monthLeft + ' Month',
                              color: priceColor,
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        model.pending == "true"
                            ? Column(
                                children: [
                                  CustomText(
                                    title: 'NEWS:',
                                    fontSize: 20,
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  CustomText(
                                    title: model.news,
                                    color: priceColor,
                                    fontSize: 20,
                                  ),
                                ],
                              )
                            : CustomText(
                                title: 'Payment History:',
                                fontSize: 20,
                              ),
                        SizedBox(
                          height: 10,
                        ),
                        GetBuilder<AqsatViewModel>(
                          builder: (controller) => Container(
                            height: model.pending == "true"
                                ? 0
                                : MediaQuery.of(context).size.height * 0.4 - 79,
                            child: ListView.builder(
                                itemCount: model.paymentHistory.length,
                                itemBuilder: (context, index) {
                                  return Container(
                                    height: 30,
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            CustomText(
                                              title: model
                                                  .paymentHistory.entries
                                                  .toList()[index]
                                                  .key,
                                              color: Colors.green.shade800,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            CustomText(
                                              title: model
                                                  .paymentHistory.entries
                                                  .toList()[index]
                                                  .value,
                                              color: Colors.green.shade800,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ],
                                        ),
                                        Divider(
                                          indent: 10,
                                          endIndent: 10,
                                          thickness: 0.5,
                                          height: 1,
                                          color: Colors.grey,
                                        )
                                      ],
                                    ),
                                  );
                                }),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        model.pending == "true"
                            ? GetBuilder<AqsatViewModel>(
                                builder: (controller) => Container(
                                  height: 70,
                                  alignment: Alignment.bottomCenter,
                                  child: CustomButton(
                                      color: Colors.red,
                                      title: 'Delete',
                                      onPressed: () {
                                        controller.delete(model.buyId);
                                        controller.aqsatme.clear();
                                        controller.getAqsatMe();
                                        Get.back();
                                      }),
                                ),
                              )
                            : Container(
                                height: 0,
                              )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 180, top: 80),
              child: Container(
                height: 200,
                width: 200,
                child: Image.network(
                  model.img,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: bottomNavigationBar(),
    );
  }

  Widget bottomNavigationBar() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 20,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      height: 70,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 15),
              child: CustomText(
                title: "Left:",
                color: primaryColor,
                fontSize: 25,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 15),
              child: CustomText(
                title: model.total + " JOD",
                color: priceColor,
                fontSize: 25,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
