import 'dart:io';

import 'package:aqsat/core/service/firestore_user.dart';
import 'package:aqsat/helper/local_storageData.dart';
import 'package:aqsat/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_core/firebase_core.dart' as firebase_core;
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:location/location.dart';

class ProfileViewModel extends GetxController {
  ValueNotifier<bool> get loading => _loading;
  ValueNotifier<bool> _loading = ValueNotifier(false);
  final LocalStorageData localStorageData = Get.find();

  UserModel get userModel => _userModel;
  late UserModel _userModel;
  @override
  void onInit() {
    super.onInit();
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

  Future<void> signOut() async {
    GoogleSignIn().signOut();
    FirebaseAuth.instance.signOut();
    localStorageData.deleteUser();
  }

  var img;
  var imgUrl;
  final picker = ImagePicker();

  Future getImage(uid, name) async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      _loading.value = true;
      img = File(pickedFile.path);
      await uploadFile(name)
          .then((value) => downloadUrl(refrence))
          .then((value) => editPic(uid, imgUrl));

      _loading.value = false;
    } else {
      print('No image selected.');
    }
    update();
  }

  var refrence;
  Future<void> uploadFile(name) async {
    String ref = 'uploads/$name';
    try {
      await firebase_storage.FirebaseStorage.instance.ref(ref).putFile(img);
    } on firebase_core.FirebaseException catch (e) {
      // e.g, e.code == 'canceled'
      print(e);
    }

    refrence = ref;
    update();
  }

  Future<void> downloadUrl(refrence) async {
    String downloadURL = await firebase_storage.FirebaseStorage.instance
        .ref(refrence)
        .getDownloadURL();
    imgUrl = downloadURL.toString();

    // Within your widgets:
    // Image.network(downloadURL);
    update();
  }

  void editPic(String uid, String imgUrl) async {
    print(imgUrl);
    await FireStoreUser().editPic(uid, imgUrl);
  }
}
