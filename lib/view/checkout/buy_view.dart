import 'package:aqsat/constance.dart';
import 'package:aqsat/core/viewmodel/buyViewModel.dart';
import 'package:aqsat/model/address_model.dart';
import 'package:aqsat/model/productModel.dart';
import 'package:aqsat/view/control_view.dart';
import 'package:aqsat/view/home_view.dart';
import 'package:aqsat/view/widget/custom_butoon.dart';
import 'package:aqsat/view/widget/custom_text.dart';
import 'package:aqsat/view/widget/custom_textField.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BuyView extends StatelessWidget {
  ProductModel model;
  String latitude, longitude;
  BuyView({
    required this.model,
    required this.latitude,
    required this.longitude,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BuyViewModel>(
      init: BuyViewModel(
        model: model,
        latitude: latitude,
        longitude: longitude,
      ),
      builder: (controller) => Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    child: IconButton(
                      icon: Icon(Icons.arrow_back_ios_new),
                      onPressed: () {
                        Get.back();
                      },
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1 - 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        title: 'Phone :',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      CustomText(
                        title: controller.model.name,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        title: 'first pay :',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      CustomText(
                        title: controller.firstPay.toString() + ' JOD',
                        color: priceColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        title: 'monthly pay :',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      CustomText(
                        title:
                            controller.monthlyPay!.toStringAsFixed(2) + ' JOD',
                        color: priceColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        title: 'time :',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      CustomText(
                        title: '12 month',
                        color: priceColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  CustomText(
                    title: 'pay with :',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                      height: MediaQuery.of(context).size.height * 0.1 + 50,
                      child: Column(
                        children: [
                          RadioListTile(
                            value: 0,
                            groupValue: controller.value,
                            onChanged: (val) {
                              controller.value = int.parse(val.toString());
                              controller.update();
                            },
                            title: Text("Cash"),
                          ),
                          RadioListTile(
                            value: 1,
                            groupValue: controller.value,
                            onChanged: (val) {
                              controller.value = int.parse(val.toString());
                              controller.update();
                            },
                            title: Text("Visa"),
                          ),
                        ],
                      )),
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    height: 55,
                    alignment: Alignment.bottomCenter,
                    child: CustomButton(
                        title: 'Buy Now',
                        onPressed: () {
                          if (controller.value == 1) {
                            Get.snackbar(
                                "SOON", "This feature will be avalibale soon",
                                backgroundColor: primaryColor,
                                colorText: Colors.white);
                          } else {
                            controller.buy();
                            Get.offAll(ControlView());
                          }
                        }),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
