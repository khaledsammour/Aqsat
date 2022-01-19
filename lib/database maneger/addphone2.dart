/*import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class Addphone2 extends StatefulWidget {
  const Addphone2({Key? key}) : super(key: key);

  @override
  _Addphone2State createState() => _Addphone2State();
}

class _Addphone2State extends State<Addphone2> {
  final formKey = GlobalKey<FormState>();
  TextEditingController name = TextEditingController();
  TextEditingController img = TextEditingController();
  TextEditingController price = TextEditingController();
  late File image;
  late String imgUrl;

  sendData() async {
    if (formKey.currentState!.validate()) {
      var storageImage = FirebaseStorage.instance.ref().child(image.path);
      var task = storageImage.putFile(image);
      imgUrl = await (await task.onComplete).ref.getDownloadURL();
      await Firestore.instance.collection("mobiles").add(
          {'name': name.text, 'img': imgUrl.toString(), 'price': price.text});
    }
  }

  Future getImage() async {
    var img = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      image = img;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("add phone"),
      ),
      body: ListView(
        children: <Widget>[
          Form(
            key: formKey,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(25),
                  child: InkWell(
                    onTap: () {
                      getImage();
                    },
                    child: CircleAvatar(
                      radius: 100,
                      backgroundImage: FileImage(image),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(25),
                  child: TextFormField(
                    controller: name,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "it is empty";
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(labelText: "name..."),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(25),
                  child: TextFormField(
                    controller: price,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "it is empty";
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(labelText: "price..."),
                  ),
                ),
                RaisedButton(
                    child: Text("send"),
                    onPressed: () {
                      sendData();
                    })
              ],
            ),
          )
        ],
      ),
    );
  }
}*/
