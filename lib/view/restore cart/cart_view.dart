/*import 'package:aqsat/constance.dart';
import 'package:aqsat/core/viewmodel/cart_viewModel.dart';
import 'package:aqsat/view/widget/custom_butoon.dart';
import 'package:aqsat/view/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CartView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartViewModle>(
        init: CartViewModle(),
        builder: (controller) => Scaffold(
              body: controller.cartProductModel.length == 0
                  ? Column(
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
                    )
                  : Column(
                      children: [
                        Expanded(
                          child: Container(
                            child: ListView.separated(
                              itemCount: controller.cartProductModel.length,
                              itemBuilder: (context, index) {
                                return Container(
                                    height: 140,
                                    child: Row(
                                      children: [
                                        Container(
                                            width: 140,
                                            child: Image.network(
                                              controller
                                                  .cartProductModel[index].img,
                                              fit: BoxFit.fill,
                                            )),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 30),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              CustomText(
                                                title: controller
                                                    .cartProductModel[index]
                                                    .name,
                                                fontSize: 24,
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              CustomText(
                                                color: primaryColor,
                                                title:
                                                    '\$ ${controller.cartProductModel[index].price.toString()}',
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Container(
                                                width: 140,
                                                color: Colors.grey.shade200,
                                                height: 40,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    GestureDetector(
                                                      child: Icon(
                                                        Icons.add,
                                                        color: Colors.black,
                                                      ),
                                                      onTap: () {
                                                        controller
                                                            .increaseQuantity(
                                                                index);
                                                      },
                                                    ),
                                                    SizedBox(
                                                      width: 20,
                                                    ),
                                                    CustomText(
                                                      title: controller
                                                          .cartProductModel[
                                                              index]
                                                          .quantity
                                                          .toString(),
                                                      alignment:
                                                          Alignment.center,
                                                      fontSize: 20,
                                                      color: Colors.black,
                                                    ),
                                                    SizedBox(
                                                      width: 20,
                                                    ),
                                                    GestureDetector(
                                                      child: Container(
                                                        padding:
                                                            EdgeInsets.only(
                                                                bottom: 20),
                                                        child: Icon(
                                                          Icons.minimize,
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                      onTap: () {
                                                        controller
                                                            .decreaseQuantity(
                                                                index);
                                                      },
                                                    )
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ));
                              },
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return SizedBox(
                                  height: 15,
                                );
                              },
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 30, right: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  CustomText(
                                    title: 'TOTAL',
                                    fontSize: 22,
                                    color: Colors.grey,
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  GetBuilder<CartViewModle>(
                                    init: CartViewModle(),
                                    builder: (controller) => CustomText(
                                      title: '\$ ${controller.totalPrice}',
                                      color: primaryColor,
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                  padding: EdgeInsets.all(20),
                                  width: 160,
                                  height: 100,
                                  child: CustomButton(
                                    onPressed: () {},
                                    title: 'CHECKOUT',
                                  ))
                            ],
                          ),
                        )
                      ],
                    ),
            ));
  }
}*/
