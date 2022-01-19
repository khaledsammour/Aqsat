import 'dart:io';
import 'package:aqsat/core/service/firestore_product.dart';
import 'package:aqsat/model/productModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_core/firebase_core.dart' as firebase_core;

class AddPhoneViewModel extends GetxController {
  double? firstPay, monthlyPay;
  late String name, description, storage, quantity, price, popular, cpu, ram;
  var category;
  var items = [
    DropdownMenuItem(child: Text("Apple"), value: 'Apple'),
    DropdownMenuItem(child: Text("Samsung"), value: 'Samsung'),
    DropdownMenuItem(child: Text("Lenovo"), value: 'Lenovo'),
    DropdownMenuItem(child: Text("oopo"), value: 'oopo'),
    DropdownMenuItem(child: Text("Huawei"), value: 'Huawei'),
  ];
  // late Color color;

  var img;
  var imgUrl;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      img = File(pickedFile.path);

      print(img);
    } else {
      print('No image selected.');
    }
    update();
  }

  var refrence;
  Future<void> uploadFile() async {
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

  Future<void> downloadUrl() async {
    String downloadURL = await firebase_storage.FirebaseStorage.instance
        .ref(refrence)
        .getDownloadURL();
    imgUrl = downloadURL;
    print(imgUrl);

    // Within your widgets:
    // Image.network(downloadURL);
    update();
  }

  getfirstPay() {
    firstPay = double.parse(price) * 0.20;
  }

  getmonthlyPay() {
    monthlyPay = (double.parse(price) - firstPay!) / 12;
  }

  void saveProduct() async {
    getfirstPay();
    getmonthlyPay();
    ProductModel productModel = ProductModel(
      categorey: category,
      name: name,
      img: imgUrl.toString(),
      description: description,
      storage: storage,
      price: price.toString(),
      firstPay: firstPay!.toStringAsFixed(2),
      monthlyPay: monthlyPay!.toStringAsFixed(2),
      productId: name,
      popular: popular,
      quantity: quantity,
      cpu: cpu,
      ram: ram,
    );
    await FireStoreProduct().addProduct(productModel);
  }
}
