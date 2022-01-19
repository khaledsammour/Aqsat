import 'package:aqsat/core/service/firestore_buying.dart';
import 'package:aqsat/helper/local_storageData.dart';
import 'package:aqsat/model/buyModel.dart';
import 'package:aqsat/model/productModel.dart';
import 'package:aqsat/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BuyViewModel extends GetxController {
  late ProductModel model;
  String latitude, longitude;
  late String phoneNumber;

  ValueNotifier<bool> get loading => _loading;
  ValueNotifier<bool> _loading = ValueNotifier(false);
  final LocalStorageData localStorageData = Get.find();

  UserModel get userModel => _userModel;
  late UserModel _userModel;
  BuyViewModel({
    required this.model,
    required this.latitude,
    required this.longitude,
  });
  late double pricePro = double.parse(model.price);
  double? price, firstPay, monthlyPay;
  int? value = 0;
  @override
  void onInit() {
    super.onInit();
    getPrice();
    getfirstPay();
    getmonthlyPay();
    getCurrentUser();
  }

  void getCurrentUser() async {
    _loading.value = true;
    await localStorageData.getUser.then((value) {
      _userModel = value!;
    });
    _loading.value = false;
    update();
  }

  getPrice() {
    price = pricePro;
  }

  getfirstPay() {
    firstPay = price! * 0.20;
  }

  getmonthlyPay() {
    monthlyPay = (price! - firstPay!) / 12;
  }

  String getTime() {
    return DateTime.now().toString();
  }

  buy() async {
    BuyModel buyModel = BuyModel(
      monthLeft: '12',
      userId: userModel.userId,
      name: model.name,
      price: model.price,
      img: model.img,
      firstPay: firstPay!.toStringAsFixed(2),
      monthlyPay: monthlyPay!.toStringAsFixed(2),
      total: model.price,
      pending: 'true',
      news: 'Waiting for Shipment',
      latitude: latitude,
      longitude: longitude,
      productId: model.productId,
      time: getTime(),
      paymentHistory: {},
      lastPayDate: " ",
    );
    await FireStoreBuy().addbuyToFireStore(buyModel);
  }
}
