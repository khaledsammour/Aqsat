import 'package:aqsat/core/viewmodel/addphoneViewModel.dart';
import 'package:aqsat/view/widget/custom_textField.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Add extends GetWidget<AddPhoneViewModel> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddPhoneViewModel>(
      init: AddPhoneViewModel(),
      builder: (controller) => Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 120),
              GestureDetector(
                onTap: () {
                  controller.getImage();
                },
                child: controller.img != null
                    ? Container(
                        height: 100,
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 16),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.file(
                            controller.img,
                            fit: BoxFit.cover,
                          ),
                        ),
                      )
                    : Container(
                        height: 100,
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 16),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 1,
                                  blurRadius: 10,
                                  offset:
                                      Offset(0, 3) // changes position of shadow
                                  ),
                            ],
                            borderRadius: BorderRadius.circular(20)),
                        child: Icon(
                          Icons.add_a_photo,
                          color: Colors.black45,
                        ),
                      ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 10,
                        offset: Offset(0, 3) // changes position of shadow
                        ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: CustomTextField(
                      title: 'name',
                      hint: 'iphone',
                      onchange: (val) {
                        controller.name = val;
                      }),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              CustomTextField(
                  title: 'description',
                  hint: '500',
                  onchange: (val) {
                    controller.description = val;
                  }),
              SizedBox(
                height: 25,
              ),
              CustomTextField(
                  title: 'storage',
                  hint: '500',
                  onchange: (val) {
                    controller.storage = val;
                  }),
              SizedBox(
                height: 25,
              ),
              CustomTextField(
                  title: 'price',
                  hint: '500',
                  onchange: (val) {
                    controller.price = val;
                  }),
              SizedBox(
                height: 25,
              ),
              CustomTextField(
                  title: 'quantity',
                  hint: '10',
                  onchange: (val) {
                    controller.quantity = val;
                  }),
              SizedBox(
                height: 25,
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
              GestureDetector(
                onTap: () {
                  controller.uploadFile().then((v) {
                    controller.downloadUrl();
                    if (controller.imgUrl == null) {
                      return print('no pic');
                    }
                    controller.saveProduct();

                    Get.back();
                  });
                },
                child: Container(
                  decoration: (BoxDecoration(
                    color: Color(0xfff36417),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(1),
                          spreadRadius: 1,
                          blurRadius: 10,
                          offset: Offset(0, 3) // changes position of shadow
                          ),
                    ],
                  )),
                  margin: EdgeInsets.all(20),
                  height: 60,
                  width: MediaQuery.of(context).size.width - 20,
                  child: Center(
                    child: Text(
                      "submit",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
