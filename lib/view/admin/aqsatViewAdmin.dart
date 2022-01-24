import 'package:aqsat/core/viewmodel/admin/adminAqsatViewModel.dart';
import 'package:aqsat/view/widget/custom_butoon.dart';
import 'package:aqsat/view/widget/custom_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';

import '../control_view.dart';
import '../orders_details_view.dart';
import '../pending_detail_view.dart';

class AdminViewAqsat extends StatelessWidget {
  const AdminViewAqsat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 60,
          ),
          Container(
            height: 30,
            child: CustomText(
              title: "Pending Orders:",
              fontSize: 30,
            ),
          ),
          GetBuilder<AdminAqsatViewModel>(builder: (controller) {
            return Container(
              height: 300,
              child: controller.pendingOrders.length == 0
                  ? Center(
                      child: CustomText(
                        title: "NO Pending Orders",
                      ),
                    )
                  : _newPendingOrder(),
            );
          }),
          CustomText(
            title: "Orders:",
            fontSize: 30,
          ),
          SizedBox(
            height: 10,
          ),
          GetBuilder<AdminAqsatViewModel>(builder: (controller) {
            return Container(
              height: 300,
              child: controller.allOrders.length == 0
                  ? Center(
                      child: CustomText(
                        title: 'No Orders Yet',
                      ),
                    )
                  : _newOrder(),
            );
          }),
        ],
      ),
    );
  }

  Widget _newPendingOrder() {
    return GetBuilder<AdminAqsatViewModel>(builder: (controller) {
      return ListView.builder(
        itemCount: controller.pendingOrders.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              controller.getBuyUser(controller.pendingOrders[index].userId);
              Get.to(PendingDetailsView(
                  userModel: controller.buyUser,
                  model: controller.pendingOrders[index]));
            },
            child: Container(
              height: 70,
              child: Column(
                children: [
                  ListTile(
                    leading: Container(
                        width: 70,
                        child: CachedNetworkImage(
                            imageUrl: controller.pendingOrders[index].img)),
                    trailing: Text(
                      controller.pendingOrders[index].total + " JD",
                      style: TextStyle(color: Colors.green.shade500),
                    ),
                    title: Text(controller.pendingOrders[index].name +
                        "\n" +
                        controller.pendingOrders[index].userId),
                  ),
                  Container(
                    height: 0.4,
                    color: Colors.grey.withOpacity(0.6),
                    width: MediaQuery.of(context).size.width - 80,
                  )
                ],
              ),
            ),
          );
        },
      );
    });
  }

  Widget _newOrder() {
    return GetBuilder<AdminAqsatViewModel>(builder: (controller) {
      return ListView.builder(
        itemCount: controller.allOrders.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              controller.getBuyUser(controller.allOrders[index].userId);
              Get.to(OrdersDetailsView(
                  userModel: controller.buyUser,
                  model: controller.allOrders[index]));
            },
            child: Container(
              height: 70,
              child: Column(
                children: [
                  ListTile(
                    leading: Container(
                        width: 70,
                        child: CachedNetworkImage(
                            imageUrl: controller.allOrders[index].img)),
                    trailing: Text(
                      controller.allOrders[index].total.substring(0, 5) + " JD",
                      style: TextStyle(color: Colors.green.shade500),
                    ),
                    title: Text(controller.allOrders[index].name +
                        "\n" +
                        controller.allOrders[index].userId),
                  ),
                  Container(
                    height: 0.4,
                    color: Colors.grey.withOpacity(0.6),
                    width: MediaQuery.of(context).size.width - 80,
                  )
                ],
              ),
            ),
          );
        },
      );
    });
  }

  Widget _oldOrder() {
    return GetBuilder<AdminAqsatViewModel>(builder: (controller) {
      return ListView.builder(
          itemCount: controller.allOrders.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  Get.to(OrdersDetailsView(
                    userModel: controller.buyUser,
                    model: controller.allOrders[index],
                  ));
                },
                child: Container(
                  height: 250,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Container(
                          height: 100,
                          child: Image.network(controller.allOrders[index].img),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 50,
                          child: CustomText(
                            title: controller.allOrders[index].name,
                          ),
                        ),
                        CustomButton(
                            title: "Pay Month",
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
                                                    controller.allOrders[index]
                                                        .productId,
                                                    controller.allOrders[index]
                                                        .monthlyPay,
                                                    controller
                                                        .allOrders[index].total,
                                                    controller.allOrders[index]
                                                        .monthLeft);
                                              }),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ));
                            }),
                      ],
                    ),
                  ),
                ),
              ));
    });
  }

  Widget _oldPendingOrder() {
    return GetBuilder<AdminAqsatViewModel>(builder: (controller) {
      return ListView.builder(
          itemCount: controller.pendingOrders.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  Get.to(PendingDetailsView(
                      userModel: controller.buyUser,
                      model: controller.pendingOrders[index]));
                },
                child: Container(
                  height: 250,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Container(
                          height: 100,
                          child: Image.network(
                              controller.pendingOrders[index].img),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 50,
                          child: CustomText(
                            title: controller.pendingOrders[index].name,
                          ),
                        ),
                        CustomButton(
                            title: "Confirm",
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
                                          title: "Confirm ?",
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
                                                controller.confirm(
                                                    controller
                                                        .pendingOrders[index]
                                                        .buyId,
                                                    double.parse(controller
                                                        .pendingOrders[index]
                                                        .total),
                                                    double.parse(controller
                                                        .pendingOrders[index]
                                                        .firstPay));
                                                controller.pendingOrders
                                                    .clear();
                                                controller.allOrders.clear();
                                                controller.getAllPending();
                                                controller.getAllAqsat();
                                              }),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ));
                            }),
                      ],
                    ),
                  ),
                ),
              ));
    });
  }
}
