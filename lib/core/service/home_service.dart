import 'package:cloud_firestore/cloud_firestore.dart';

class HomeService {
  final CollectionReference _categoryCollectionRef =
      FirebaseFirestore.instance.collection('category');
  final CollectionReference _productCollectionRef =
      FirebaseFirestore.instance.collection('Product');

  Future<List<QueryDocumentSnapshot>> getCategory() async {
    var value = await _categoryCollectionRef.get();
    return value.docs;
  }

  Future<List<QueryDocumentSnapshot>> getproduct() async {
    var value = await _productCollectionRef.get();
    return value.docs;
  }

  Future<List<QueryDocumentSnapshot>> getPopular() async {
    var value =
        await _productCollectionRef.where('popular', isEqualTo: 'true').get();
    return value.docs;
  }

  Future<List<QueryDocumentSnapshot>> getads() async {
    var value =
        await _productCollectionRef.where('cool', isEqualTo: 'true').get();
    return value.docs;
  }

  Future<List<QueryDocumentSnapshot>> getGategoryPro(String category) async {
    var value = await _productCollectionRef
        .where('categorey', isEqualTo: category)
        .get();
    return value.docs;
  }

  Future<List<QueryDocumentSnapshot>> getSearchResult(search) async {
    var value = await _productCollectionRef
        .where('name', isGreaterThanOrEqualTo: search)
        .where('name', isLessThan: search + 'z')
        .get();
    return value.docs;
  }
}
