import 'package:animations/animations.dart';
import 'package:aqsat/constance.dart';
import 'package:aqsat/core/viewmodel/home_viewModel.dart';
import 'package:aqsat/view/details_view.dart';
import 'package:aqsat/view/widget/custom_butoon.dart';
import 'package:aqsat/view/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductView extends StatelessWidget {
  const ProductView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
        builder: (controller) => Scaffold(
              appBar: AppBar(
                leading: IconButton(
                  icon: Icon(Icons.arrow_back_ios_new),
                  color: Colors.black,
                  onPressed: () {
                    Get.back();
                  },
                ),
                backgroundColor: Colors.white,
                title: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 80),
                  child: CustomText(
                    title: 'Products',
                    fontSize: 27,
                  ),
                ),
                elevation: 3,
              ),
              body: ListView.builder(
                itemCount: controller.allProduct.length,
                itemBuilder: (context, index) => SingleChildScrollView(
                  child: Column(children: [
                    SizedBox(
                      height: 10,
                    ),
                    OpenContainer(
                        transitionDuration: Duration(milliseconds: 400),
                        closedColor: Color(0xfff8f8f8).withOpacity(0),
                        closedElevation: 0,
                        openColor: primaryColor,
                        transitionType: ContainerTransitionType.fadeThrough,
                        closedBuilder: (_, openContainer) {
                          return Stack(children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 2,
                                      blurRadius: 20,
                                      offset: Offset(
                                          0, 3), // changes position of shadow
                                    ),
                                  ],
                                ),
                                height:
                                    MediaQuery.of(context).size.height * 0.1 +
                                        40,
                                width: MediaQuery.of(context).size.width - 5,
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.3,
                                    ),
                                    Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                                  0.1 +
                                              40,
                                      width: MediaQuery.of(context).size.width *
                                              0.3 +
                                          15,
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: 10,
                                          ),
                                          CustomText(
                                            title: controller
                                                .allProduct[index].name,
                                            fontSize: 20,
                                            color: primaryColor,
                                          ),
                                          SizedBox(
                                            height: 25,
                                          ),
                                          CustomText(
                                            title: 'First Pay:' +
                                                controller
                                                    .allProduct[index].firstPay,
                                            fontSize: 15,
                                            color: primaryColor,
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          CustomText(
                                            title: 'Monthly:' +
                                                double.parse(controller
                                                        .allProduct[index]
                                                        .monthlyPay)
                                                    .toStringAsFixed(1) +
                                                " JOD",
                                            color: Colors.red,
                                            fontSize: 15,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      height: 50,
                                      width: MediaQuery.of(context).size.width *
                                          0.3,
                                      child: CustomButton(
                                        title: 'Get Now',
                                        onPressed: openContainer,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 10,
                              ),
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.1 +
                                        35,
                                width: MediaQuery.of(context).size.width * 0.3,
                                child: Image.network(
                                  controller.allProduct[index].img,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ]);
                        },
                        openBuilder: (_, __) {
                          return DetailsView(
                              model: controller.allProduct[index]);
                        }),
                    SizedBox(
                      height: 10,
                    )
                  ]),
                ),
              ),
            ));
  }
}
