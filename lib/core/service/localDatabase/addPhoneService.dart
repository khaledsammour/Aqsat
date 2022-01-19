import 'package:cloud_firestore/cloud_firestore.dart';

class AddPhoneService {
  Future<void> addDAta(phoneData) async {
    FirebaseFirestore.instance
        .collection("mobiles")
        .add(phoneData)
        .catchError((e) {
      print(e);
    });
  }

  getData() async {
    return await FirebaseFirestore.instance.collection("mobiles").snapshots();
  }
}
