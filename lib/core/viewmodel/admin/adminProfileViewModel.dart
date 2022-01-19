import 'dart:collection';

import 'package:aqsat/core/service/admin/firestore_editProduct.dart';
import 'package:aqsat/helper/local_storageData.dart';
import 'package:aqsat/model/address_model.dart';
import 'package:aqsat/model/productModel.dart';
import 'package:aqsat/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AdminProfileViewModel extends GetxController {
  var myMarker = HashSet<Marker>();
  ValueNotifier<bool> get loading => _loading;
  ValueNotifier<bool> _loading = ValueNotifier(false);
  final LocalStorageData localStorageData = Get.find();
  List<ProductModel> get productModel => _productModel;
  List<ProductModel> _productModel = [];
  List<UserModel> get usersModel => _usersModel;
  List<UserModel> _usersModel = [];
  List<AddressModel> get addressModel => _addressModel;
  List<AddressModel> _addressModel = [];
  UserModel get userModel => _userModel;
  late UserModel _userModel;
  @override
  void onInit() {
    super.onInit();
    getProduct();
    getUsers();
    getCurrentUser();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    _addressModel.clear();
  }

  void getCurrentUser() async {
    _loading.value = true;
    await localStorageData.getUser.then((value) {
      _userModel = value!;
    }).then((value) => _loading.value = false);

    update();
  }

  void onMapCreated(latitude, longitude) {
    myMarker.add(
        Marker(markerId: MarkerId('1'), position: LatLng(latitude, longitude)));
    update();
  }

  Future<void> signOut() async {
    GoogleSignIn().signOut();
    FirebaseAuth.instance.signOut();
    localStorageData.deleteUser();
  }

  getProduct() async {
    _loading.value = true;
    ProductService().getproduct().then((value) {
      for (int i = 0; i < value.length; i++) {
        _productModel.add(ProductModel.fromJson(value[i].data()));
        _loading.value = false;
      }
      update();
    });
  }

  getUsers() async {
    _loading.value = true;
    ProductService().getUsers().then((value) {
      for (int i = 0; i < value.length; i++) {
        _usersModel.add(UserModel.fromJson(value[i].data()));
        _loading.value = false;
      }
      update();
    });
  }

  getAdress(UserModel v) async {
    _loading.value = true;
    ProductService().getLcoation(v.userId).then((value) {
      for (int i = 0; i < value.length; i++) {
        _addressModel.add(AddressModel.fromJson(value[i].data()));
        _loading.value = false;
      }
      update();
    });
  }

  void delete(id) {
    _loading.value = true;
    ProductService().deleteOrder(id);
    update();
    _loading.value = false;
  }

  void deleteUser(id) {
    _loading.value = true;
    ProductService().deleteUser(id);
    update();
    _loading.value = false;
  }

  void changeName(id, newName) {
    _loading.value = true;
    ProductService().changeName(id, newName);
    update();
    _loading.value = false;
  }

  void chaneSomething(id, something, newName) {
    _loading.value = true;
    ProductService().changeSomething(id, something, newName);
    update();
    _loading.value = false;
  }
}
