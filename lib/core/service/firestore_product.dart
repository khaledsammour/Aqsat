import 'package:aqsat/model/productModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreProduct {
  final CollectionReference _productCollectionRef =
      FirebaseFirestore.instance.collection('Product');
  Future<void> addProduct(ProductModel productModel) async {
    await _productCollectionRef
        .doc(productModel.name)
        .set(productModel.toJson());
  }
}
