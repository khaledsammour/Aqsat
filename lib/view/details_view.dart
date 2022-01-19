import 'package:aqsat/constance.dart';
import 'package:aqsat/model/productModel.dart';
import 'package:aqsat/view/checkout/adressView.dart';
import 'package:aqsat/view/widget/custom_butoon.dart';
import 'package:aqsat/view/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailsView extends StatelessWidget {
  ProductModel model;
  DetailsView({required this.model});

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
                              color: Colors.white24,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            CustomText(
                              title: model.cpu,
                              color: Colors.white24,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            CustomText(
                              title: 'Ram',
                              color: Colors.white24,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            CustomText(
                              title: model.ram,
                              color: Colors.white24,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            CustomText(
                              title: 'storage',
                              color: Colors.white24,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            CustomText(
                              title: model.storage,
                              color: Colors.white24,
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
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        height: 800,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomText(
                                    title: 'First pay:',
                                  ),
                                  CustomText(
                                    title: double.parse(model.firstPay)
                                            .toStringAsFixed(2) +
                                        ' JOD',
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomText(
                                    title: 'monthly pay:',
                                  ),
                                  CustomText(
                                    title: double.parse(model.monthlyPay)
                                            .toStringAsFixed(2) +
                                        ' JOD',
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomText(
                                    title: 'Time:',
                                  ),
                                  CustomText(
                                    title: '12 Month',
                                    color: priceColor,
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              CustomText(
                                title: 'Overview',
                                fontSize: 20,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              CustomText(
                                title: model.description,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
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
                title: model.price + " JOD",
                color: priceColor,
                fontSize: 25,
              ),
            ),
            Container(
                width: 220,
                child: CustomButton(
                    title: 'GetNow',
                    onPressed: () {
                      Get.to(AddressView(model: model));
                    }))
          ],
        ),
      ),
    );
  }
}
