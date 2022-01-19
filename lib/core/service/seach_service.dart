import 'package:cloud_firestore/cloud_firestore.dart';

class SearchService {
  searchByName(String searchField) {
    return FirebaseFirestore.instance
        .collection('Product')
        .where('name', isEqualTo: searchField.toUpperCase().toString())
        .get();
  }
}
