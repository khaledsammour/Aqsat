import 'package:cloud_firestore/cloud_firestore.dart';

class ProductService {
  final CollectionReference _productCollectionRef =
      FirebaseFirestore.instance.collection('Product');
  final CollectionReference _UsersCollectionRef =
      FirebaseFirestore.instance.collection('Users');
  final CollectionReference _LocationCollectionRef =
      FirebaseFirestore.instance.collection('Address');

  Future<List<QueryDocumentSnapshot>> getproduct() async {
    var value = await _productCollectionRef.get();
    return value.docs;
  }

  void deleteOrder(id) async {
    return await _productCollectionRef.doc(id).delete();
  }

  void deleteUser(id) async {
    return await _UsersCollectionRef.doc(id).delete();
  }

  void changeName(id, newName) async {
    return await _productCollectionRef.doc(id).update({'name': newName});
  }

  Future<List<QueryDocumentSnapshot>> getLcoation(id) async {
    var value =
        await _LocationCollectionRef.where('userId', isEqualTo: id).get();
    return value.docs;
  }

  void changeSomething(id, something, newName) async {
    return await _productCollectionRef.doc(id).update({something: newName});
  }

  Future<List<QueryDocumentSnapshot>> getUsers() async {
    var value = await _UsersCollectionRef.get();
    return value.docs;
  }
}
