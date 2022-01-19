import 'package:aqsat/core/service/home_service.dart';
import 'package:aqsat/model/productModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchViewModel extends GetxController {
  List<ProductModel> get searchResult => _searchResult;
  List<ProductModel> _searchResult = [];
  ValueNotifier<bool> get loading => _loading;
  ValueNotifier<bool> _loading = ValueNotifier(false);
  double? height, width;
  SearchViewModel() {
    closeSearch();
  }
  searchForItem(search) {
    _loading.value = true;
    HomeService().getSearchResult(search).then((value) {
      for (int i = 0; i < value.length; i++) {
        _searchResult.add(ProductModel.fromJson(value[i].data()));
      }
      _loading.value = false;

      update();
    });
  }

  openSearch(BuildContext context) {
    height = MediaQuery.of(context).size.height * .5;
    width = MediaQuery.of(context).size.width * .9;
    update();
  }

  closeSearch() {
    height = 0;
    width = 0;
    update();
  }
}
