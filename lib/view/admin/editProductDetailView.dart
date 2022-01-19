import 'package:aqsat/constance.dart';
import 'package:aqsat/core/viewmodel/admin/adminProfileViewModel.dart';
import 'package:aqsat/model/productModel.dart';
import 'package:aqsat/view/checkout/adressView.dart';
import 'package:aqsat/view/control_view.dart';
import 'package:aqsat/view/widget/custom_butoon.dart';
import 'package:aqsat/view/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProductDetailsView extends StatelessWidget {
  ProductModel model;
  EditProductDetailsView({required this.model});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AdminProfileViewModel>(
      builder: (controller) => Scaffold(
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
                          TextField(
                            decoration: InputDecoration(hintText: model.name),
                            onSubmitted: (val) {
                              controller.chaneSomething(
                                  model.productId, 'name', val);
                            },
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
                                title: 'core i4',
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
                                title: '12 GB',
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
                                title: '500 GB',
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
                                    Container(
                                      width: 100,
                                      child: TextField(
                                        decoration: InputDecoration(
                                            hintText: model.firstPay),
                                        onSubmitted: (val) {
                                          controller.chaneSomething(
                                              model.productId, 'firstPay', val);
                                        },
                                      ),
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
                                    Container(
                                      width: 100,
                                      child: TextField(
                                        decoration: InputDecoration(
                                            hintText: model.monthlyPay),
                                        onSubmitted: (val) {
                                          controller.chaneSomething(
                                              model.productId,
                                              'monthlyPay',
                                              val);
                                        },
                                      ),
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
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CustomText(
                                      title: 'Popular',
                                    ),
                                    Container(
                                      width: 100,
                                      child: TextField(
                                        decoration: InputDecoration(
                                            hintText: model.popular),
                                        onSubmitted: (val) {
                                          controller.chaneSomething(
                                              model.productId, 'popular', val);
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
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
                                Container(
                                  child: TextField(
                                    decoration: InputDecoration(
                                        hintText: model.description),
                                    onSubmitted: (val) {
                                      controller.chaneSomething(
                                          model.productId, 'description', val);
                                    },
                                  ),
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
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: bottomNavigationBar(),
      ),
    );
  }

  Widget bottomNavigationBar() {
    return GetBuilder<AdminProfileViewModel>(
      builder: (controller) => Container(
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
                child: Container(
                  width: 100,
                  child: TextField(
                    decoration: InputDecoration(hintText: model.price),
                    onSubmitted: (val) {
                      controller.chaneSomething(model.productId, 'price', val);
                    },
                  ),
                ),
              ),
              Container(
                  width: 220,
                  child: CustomButton(
                      title: 'Delete',
                      onPressed: () {
                        controller.delete(model.productId);
                        controller.productModel.clear();
                        controller.getProduct();
                        Get.back();
                      }))
            ],
          ),
        ),
      ),
    );
  }
}
