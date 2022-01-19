import 'dart:collection';

import 'package:aqsat/helper/local_storageData.dart';
import 'package:aqsat/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddressViewModel extends GetxController {
  GoogleMapController? mapController;
  var myMarker = HashSet<Marker>();
  double vlatitude = 32.17508293529325,
      vlongitude = 35.84746330976486,
      zoom = 10;
  var firelatitude, firelongitude;
  ValueNotifier<bool> get loading => _loading;
  ValueNotifier<bool> _loading = ValueNotifier(false);
  final LocalStorageData localStorageData = Get.find();

  UserModel get userModel => _userModel;
  late UserModel _userModel;
  @override
  void onInit() {
    super.onInit();
    getCurrentUser();
    getCurrentLocation();
  }

  void getCurrentUser() async {
    _loading.value = true;
    await localStorageData.getUser.then((value) {
      _userModel = value!;
    });
    _loading.value = false;
    update();
  }

  void onMapCreated() {
    myMarker.add(Marker(
        markerId: MarkerId('1'),
        position: LatLng(32.17508293529325, 35.84746330976486)));
    update();
  }

  void onCameraMove(latitude, longitude) {
    myMarker.clear();
    myMarker.add(
        Marker(markerId: MarkerId('1'), position: LatLng(latitude, longitude)));
    firelatitude = latitude.toString();
    firelongitude = longitude.toString();
    update();
  }

  void getCurrentLocation() {
    Geolocator.getCurrentPosition().then((Position position) {
      myMarker.clear();
      myMarker.add(Marker(
          markerId: MarkerId('1'),
          position: LatLng(position.latitude, position.longitude)));

      vlatitude = position.latitude;
      vlongitude = position.longitude;
      zoom = 4;
    });

    update();
  }

  void moveCamera(latitude, longitude, zoom) {
    mapController!.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: LatLng(latitude, longitude), zoom: zoom)));
  }
}
