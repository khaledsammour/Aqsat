import 'dart:collection';

import 'package:aqsat/core/service/firestore_buying.dart';
import 'package:aqsat/helper/local_storageData.dart';
import 'package:aqsat/model/buyModel.dart';
import 'package:aqsat/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AdminAqsatViewModel extends GetxController {
  var myMarker = HashSet<Marker>();

  ValueNotifier<bool> get loading => _loading;
  ValueNotifier<bool> _loading = ValueNotifier(false);
  UserModel? _userModel;
  UserModel get userModel => _userModel!;

  UserModel? _buyUser;
  UserModel get buyUser => _buyUser!;
  final LocalStorageData localStorageData = Get.find();
  List<BuyModel> get aqsatme => _aqsatme;
  List<BuyModel> _aqsatme = [];

  List<BuyModel> _pendingOrders = [];
  List<BuyModel> get pendingOrders => _pendingOrders;
  List<BuyModel> _allOrders = [];
  List<BuyModel> get allOrders => _allOrders;
  double? price, firstPay, monthlyPay;

  @override
  void onInit() {
    super.onInit();
    getAllPending();
    getAllAqsat();
  }

  void getBuyUser(String uid) async {
    await FireStoreBuy().getBuyUser(uid).then((value) {
      _buyUser = UserModel.fromJson(value.data()!);
    });
    update();
  }

  void getAllPending() async {
    _loading.value = true;
    FireStoreBuy().getPending().then((value) {
      for (int i = 0; i < value.length; i++) {
        _pendingOrders.add(BuyModel.fromJson(value[i].data()));
        getBuyUser(_pendingOrders[i].userId);
        _loading.value = false;
      }
      update();
    });
  }

  void getAllAqsat() async {
    _loading.value = true;
    FireStoreBuy().getOrders().then((value) {
      for (int i = 0; i < value.length; i++) {
        _allOrders.add(BuyModel.fromJson(value[i].data()));
        getBuyUser(_allOrders[i].userId);
        _loading.value = false;
      }
      update();
    });
  }

  void confirm(id, total, firstPay) {
    _loading.value = true;
    double nTotal = total - firstPay;
    String x = DateTime.now().day.toString() +
        "-" +
        DateTime.now().month.toString() +
        "-" +
        DateTime.now().year.toString();
    FireStoreBuy().confirmOrder(id, nTotal.toString(), x, firstPay.toString(),
        DateTime.now().toString());

    update();
    _loading.value = false;
  }

  void delete(id) {
    _loading.value = true;
    FireStoreBuy().deleteOrder(id);
    update();
    _loading.value = false;
  }

  void payMoth(id, payMonth, total, month) async {
    String x = DateTime.now().day.toString() +
        "-" +
        DateTime.now().month.toString() +
        "-" +
        DateTime.now().year.toString();
    double newTotal = double.parse(total) - double.parse(payMonth);
    FireStoreBuy().payMonth(id, newTotal.toStringAsFixed(1).toString(),
        DateTime.now().toString(), x, payMonth.toString(), int.parse(month));
    update();
  }

  void onMapCreated(latitude, longitude) {
    myMarker.add(
        Marker(markerId: MarkerId('1'), position: LatLng(latitude, longitude)));
    update();
  }
}
