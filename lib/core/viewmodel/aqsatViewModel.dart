import 'dart:collection';

import 'package:aqsat/core/service/firestore_buying.dart';
import 'package:aqsat/helper/local_storageData.dart';
import 'package:aqsat/model/buyModel.dart';
import 'package:aqsat/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AqsatViewModel extends GetxController {
  var myMarker = HashSet<Marker>();

  ValueNotifier<bool> get loading => _loading;
  ValueNotifier<bool> _loading = ValueNotifier(false);
  UserModel? _userModel;
  UserModel get userModel => _userModel!;

  late UserModel buyUser;
  final LocalStorageData localStorageData = Get.find();
  List<BuyModel> get aqsatme => _aqsatme;
  List<BuyModel> _aqsatme = [];

  List<BuyModel> _pendingOrders = [];
  List<BuyModel> get pendingOrders => _pendingOrders;
  List<BuyModel> _allOrders = [];
  List<BuyModel> get allOrders => _allOrders;
  double? price, firstPay, monthlyPay;
  DateTime? timeLeft;

  @override
  void onInit() {
    super.onInit();
    getCurrentUser();
  }

  void getCurrentUser() async {
    _loading.value = true;
    await localStorageData.getUser.then((value) {
      _userModel = value!;
    }).then((value) => getAqsatMe());
    _loading.value = false;

    update();
  }

  void getAqsatMe() async {
    _loading.value = true;
    FireStoreBuy().getBuy(userModel.userId).then((value) {
      for (int i = 0; i < value.length; i++) {
        _aqsatme.add(BuyModel.fromJson(value[i].data()));
        _loading.value = false;
      }
      update();
    });
  }

  void onMapCreated(latitude, longitude) {
    myMarker.add(
        Marker(markerId: MarkerId('1'), position: LatLng(latitude, longitude)));
    update();
  }

  void delete(id) {
    _loading.value = true;
    FireStoreBuy().deleteOrder(id);
    update();
    _loading.value = false;
  }

  getTime(time) {
    var x = DateTime.parse(time);
    timeLeft = x.add(Duration(days: 30));
    return timeLeft!.millisecondsSinceEpoch.toString();
  }
}
