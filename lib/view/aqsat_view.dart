import 'package:aqsat/core/viewmodel/aqsatViewModel.dart';
import 'package:aqsat/view/admin/aqsatViewAdmin.dart';
import 'package:aqsat/view/checkout/buy_detailView.dart';
import 'package:aqsat/view/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class AqsatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AqsatViewModel>(
      init: AqsatViewModel(),
      builder: (controller) => Scaffold(
          body: controller.loading.value
              ? Center(child: CircularProgressIndicator())
              : controller.userModel.type == 'admin'
                  ? AdminViewAqsat()
                  : controller.aqsatme.length != 0
                      ? _cart()
                      : _cartEmpty()),
    );
  }
}

Widget _cart() {
  return GetBuilder<AqsatViewModel>(
    builder: (controller) => SafeArea(
      child: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Expanded(
            child: Container(
              child: ListView.separated(
                itemCount: controller.aqsatme.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Get.to(BuyDetailView(model: controller.aqsatme[index]));
                    },
                    child: Container(
                        height: 200,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 20,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Container(
                                height: 150,
                                width: 150,
                                child: Image.network(
                                  controller.aqsatme[index].img,
                                  fit: BoxFit.contain,
                                )),
                            Padding(
                              padding: const EdgeInsets.only(left: 1),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 20,
                                  ),
                                  CustomText(
                                    title: controller.aqsatme[index].name,
                                    fontSize: 24,
                                  ),
                                  SizedBox(
                                    height: 45,
                                  ),
                                  Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.1,
                                    width:
                                        MediaQuery.of(context).size.width * 0.5,
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            CustomText(
                                              title: "monthly pay:",
                                            ),
                                            CustomText(
                                              title: double.parse(controller
                                                          .aqsatme[index]
                                                          .monthlyPay)
                                                      .toStringAsFixed(2) +
                                                  ' JOD',
                                              color: Colors.red,
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            CustomText(
                                              title: "price Left:",
                                            ),
                                            CustomText(
                                              title: double.parse(controller
                                                          .aqsatme[index].total)
                                                      .toStringAsFixed(2) +
                                                  ' JOD',
                                              color: Colors.red,
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            CustomText(
                                              title: "time Left:",
                                            ),
                                            controller.aqsatme[index].pending ==
                                                    "true"
                                                ? CustomText(
                                                    title: "Pending",
                                                    color: Colors.red,
                                                  )
                                                : CountdownTimer(
                                                    textStyle: TextStyle(
                                                        color: Colors.green),
                                                    endTime: int.parse(
                                                        controller.getTime(
                                                            controller
                                                                .aqsatme[index]
                                                                .lastPayDate)),
                                                  ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    height: 15,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget _cartEmpty() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      SvgPicture.asset(
        'assets/images/emptycart.svg',
        width: 200,
        height: 200,
      ),
      SizedBox(
        height: 20,
      ),
      CustomText(
        title: 'Cart Empty',
        fontSize: 32,
        alignment: Alignment.topCenter,
      )
    ],
  );
}
