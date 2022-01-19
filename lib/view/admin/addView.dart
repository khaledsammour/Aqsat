import 'package:aqsat/constance.dart';
import 'package:aqsat/core/viewmodel/addphoneViewModel.dart';
import 'package:aqsat/view/widget/custom_butoon.dart';
import 'package:aqsat/view/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Add1View extends StatelessWidget {
  const Add1View({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddPhoneViewModel>(
      init: AddPhoneViewModel(),
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
                    height: 300,
                    color: primaryColor,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          TextField(
                            decoration: InputDecoration(hintText: 'Name'),
                            onChanged: (val) {
                              controller.name = val;
                            },
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                title: 'Cpu',
                                color: Colors.white24,
                              ),
                              Container(
                                width: 50,
                                child: TextField(
                                  decoration:
                                      InputDecoration(hintText: 'core i4'),
                                  onChanged: (val) {
                                    controller.cpu = val;
                                  },
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              CustomText(
                                title: 'Ram',
                                color: Colors.white24,
                              ),
                              Container(
                                width: 50,
                                child: TextField(
                                  decoration: InputDecoration(hintText: '4GB'),
                                  onChanged: (val) {
                                    controller.ram = val;
                                  },
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              CustomText(
                                title: 'storage',
                                color: Colors.white24,
                              ),
                              Container(
                                width: 50,
                                child: TextField(
                                  decoration:
                                      InputDecoration(hintText: '250GB'),
                                  onChanged: (val) {
                                    controller.storage = val;
                                  },
                                ),
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
                                      title: 'Quantity',
                                    ),
                                    Container(
                                      width: 100,
                                      child: TextField(
                                        decoration: InputDecoration(
                                            hintText: 'Quantity'),
                                        onChanged: (val) {
                                          controller.quantity = val;
                                        },
                                      ),
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
                                            hintText: 'popular'),
                                        onChanged: (val) {
                                          controller.popular = val;
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CustomText(
                                      title: 'Category',
                                    ),
                                    GetBuilder<AddPhoneViewModel>(
                                      builder: (controller) => Container(
                                        padding: EdgeInsets.all(20.0),
                                        child: DropdownButton(
                                            value: controller.category,
                                            items: controller.items,
                                            onChanged: (val) {
                                              controller.category = val;
                                            }),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
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
                                        hintText: 'description'),
                                    onChanged: (val) {
                                      controller.description = val;
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
                padding: const EdgeInsets.only(left: 180, top: 120),
                child: GestureDetector(
                  onTap: () {
                    controller.getImage();
                  },
                  child: controller.img != null
                      ? Container(
                          height: 200,
                          width: 200,
                          margin: EdgeInsets.symmetric(horizontal: 16),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.file(
                              controller.img,
                              fit: BoxFit.fill,
                            ),
                          ),
                        )
                      : Container(
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(30)),
                          height: 200,
                          width: 200,
                          child: Icon(Icons.image)),
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
    return GetBuilder<AddPhoneViewModel>(
      init: AddPhoneViewModel(),
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
                    decoration: InputDecoration(hintText: 'price'),
                    onChanged: (val) {
                      controller.price = val;
                    },
                  ),
                ),
              ),
              Container(
                  width: 220,
                  child: CustomButton(
                      title: 'Add',
                      onPressed: () {
                        controller.uploadFile().then((v) {
                          controller.downloadUrl();
                          if (controller.imgUrl == null) {
                            return Get.snackbar(
                                'Picture', 'No Picture Selected');
                          } else {
                            controller.saveProduct();
                            Get.back();
                          }
                        });
                      }))
            ],
          ),
        ),
      ),
    );
  }
}
