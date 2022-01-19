/*import 'dart:io';

import 'package:aqsat/restore/cloud.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_core/firebase_core.dart' as firebase_core;

class ADDPHONE extends StatefulWidget {
  const ADDPHONE({Key? key}) : super(key: key);

  @override
  _ADDPHONEState createState() => _ADDPHONEState();
}

class _ADDPHONEState extends State<ADDPHONE> {
  late String name, price, productID;
  late int firstpay, ram, storage;
  bool _isLoading = false;
  CrudMethods crudMethods = new CrudMethods();
  var _image;
  final picker = ImagePicker();
  var imageFile;
  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);

        print(_image);
      } else {
        print('No image selected.');
      }
    });
  }

  var refrence;
  Future<void> uploadFile() async {
    String ref = 'uploads/$name';
    try {
      await firebase_storage.FirebaseStorage.instance.ref(ref).putFile(_image);
    } on firebase_core.FirebaseException catch (e) {
      // e.g, e.code == 'canceled'
      print(e);
    }
    setState(() {
      refrence = ref;
    });
  }

  Future<void> downloadUrl() async {
    String downloadURL = await firebase_storage.FirebaseStorage.instance
        .ref(refrence)
        .getDownloadURL();

    // Within your widgets:
    // Image.network(downloadURL);
  }

  late int x = int.parse(price) - firstpay;
  late double priceCounter = x / 12;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("add"),
      ),
      body: _isLoading
          ? Container(
              alignment: Alignment.center,
              child: CircularProgressIndicator(),
            )
          : Column(
              children: <Widget>[
                SizedBox(height: 30),
                GestureDetector(
                  onTap: () {
                    getImage();
                  },
                  child: _image != null
                      ? Container(
                          height: 100,
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.symmetric(horizontal: 16),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.file(
                              _image,
                              fit: BoxFit.cover,
                            ),
                          ),
                        )
                      : Container(
                          height: 100,
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.symmetric(horizontal: 16),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 1,
                                    blurRadius: 10,
                                    offset: Offset(
                                        0, 3) // changes position of shadow
                                    ),
                              ],
                              borderRadius: BorderRadius.circular(20)),
                          child: Icon(
                            Icons.add_a_photo,
                            color: Colors.black45,
                          ),
                        ),
                ),
                SizedBox(
                  height: 8,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: <Widget>[
                      TextField(
                        decoration: InputDecoration(hintText: "name"),
                        onChanged: (val) {
                          name = val;
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextField(
                        decoration: InputDecoration(hintText: "price"),
                        onChanged: (val) {
                          price = val;
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextField(
                        decoration: InputDecoration(hintText: "product id"),
                        onChanged: (val) {
                          productID = val;
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextField(
                        decoration: InputDecoration(hintText: "first pay"),
                        onChanged: (val) {
                          firstpay = int.parse(val);
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextField(
                        decoration: InputDecoration(hintText: "ram"),
                        onChanged: (val) {
                          ram = int.parse(val);
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextField(
                        decoration: InputDecoration(hintText: "storage"),
                        onChanged: (val) {
                          storage = int.parse(val);
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    getImage();
                    uploadFile().then((v) {
                      Map<String, String> mobileData = {
                        "imgUrl": _image.toString(),
                        "name": name,
                        "price": price,
                        "firstPay": firstpay.toString(),
                        "priceCounter": priceCounter.toString(),
                        "ram": ram.toString(),
                        "storage": storage.toString(),
                      };
                      crudMethods.addDAta(mobileData);
                      Navigator.popAndPushNamed(context, 'home');
                    });
                  },
                  child: Container(
                    decoration: (BoxDecoration(
                      color: Color(0xfff36417),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(1),
                            spreadRadius: 1,
                            blurRadius: 10,
                            offset: Offset(0, 3) // changes position of shadow
                            ),
                      ],
                    )),
                    margin: EdgeInsets.all(20),
                    height: 60,
                    width: MediaQuery.of(context).size.width - 20,
                    child: Center(
                      child: Text(
                        "submit",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                )
              ],
            ),
    );
  }
}*/
