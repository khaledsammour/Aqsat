import 'package:aqsat/model/buyModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreBuy {
  final CollectionReference _buyCollectionRef =
      FirebaseFirestore.instance.collection('buy');
  final CollectionReference _productCollectionRef =
      FirebaseFirestore.instance.collection('Product');
  final CollectionReference _userCollectionRef =
      FirebaseFirestore.instance.collection('Users');
  Future<void> addbuyToFireStore(BuyModel buyModel) async {
    var v = _buyCollectionRef.doc();
    v.set(buyModel.toJson(v.id));
  }

  Future<List<QueryDocumentSnapshot>> getBuy(String x) async {
    var value = await _buyCollectionRef.where('userId', isEqualTo: x).get();
    return value.docs;
  }

  Future<DocumentSnapshot> getBuyUser(String uid) async {
    return await _userCollectionRef.doc(uid).get();
  }

  Future<List<QueryDocumentSnapshot>> getPending() async {
    var value =
        await _buyCollectionRef.where('pending', isEqualTo: 'true').get();
    return value.docs;
  }

  Future<List<QueryDocumentSnapshot>> getOrders() async {
    var value =
        await _buyCollectionRef.where('pending', isEqualTo: 'false').get();
    return value.docs;
  }

  void confirmOrder(id, ntotal, dateMap, amount, date) async {
    return await _buyCollectionRef.doc(id).update({
      'pending': 'false',
      'news': 'Order Confirmed',
      'total': ntotal,
      'lastPayDate': date,
      'paymentHistory.$dateMap': amount,
    });
  }

  void quantitydecrease(id, x) async {
    return await _productCollectionRef.doc(id).update({
      'quantity': (x - 1).toString(),
    });
  }

  void deleteOrder(id) async {
    return await _buyCollectionRef.doc(id).delete();
  }

  void payMonth(id, newTotal, date, dateMap, amount, month) async {
    return await _buyCollectionRef.doc(id).update({
      'total': newTotal,
      'monthLeft': (month - 1).toString(),
      'lastPayDate': date,
      'paymentHistory.$dateMap': amount,
    });
  }
}
