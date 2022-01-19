import 'package:aqsat/core/service/home_service.dart';
import 'package:aqsat/model/productModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CategoryViewModel extends GetxController {
  ValueNotifier<bool> get loading => _loading;
  ValueNotifier<bool> _loading = ValueNotifier(false);
  List<ProductModel> get categoryApple => _categoryApple;
  List<ProductModel> _categoryApple = [];

  getGategoryPro(String categoryName) async {
    _loading.value = true;

    HomeService().getGategoryPro(categoryName).then((value) {
      for (int i = 0; i < value.length; i++) {
        _categoryApple.add(ProductModel.fromJson(value[i].data()));
        _loading.value = false;
      }

      update();
    });
  }
}
