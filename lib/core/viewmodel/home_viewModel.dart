import 'package:aqsat/core/service/home_service.dart';
import 'package:aqsat/model/category_model.dart';
import 'package:aqsat/model/productModel.dart';
import 'package:aqsat/view/details_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';

class HomeViewModel extends GetxController {
  ValueNotifier<bool> get loading => _loading;
  ValueNotifier<bool> _loading = ValueNotifier(false);

  ValueNotifier<bool> get search => _search;
  ValueNotifier<bool> _search = ValueNotifier(false);

  List<CategoryModel> get categoryModel => _categoryModel;
  List<CategoryModel> _categoryModel = [];

  List<ProductModel> get productModel => _productModel;
  List<ProductModel> _productModel = [];

  List<ProductModel> get allProduct => _allProduct;
  List<ProductModel> _allProduct = [];

  List<ProductModel> get adsModel => _adsModel;
  List<ProductModel> _adsModel = [];

  List<ProductModel> get popular => _popular;
  List<ProductModel> _popular = [];

  List<ProductModel> get categoryApple => _categoryApple;
  List<ProductModel> _categoryApple = [];

  List<ProductModel> get categorySamsung => _categorySamsung;
  List<ProductModel> _categorySamsung = [];
  List<ProductModel> get categoryHuawei => _categoryHuawei;
  List<ProductModel> _categoryHuawei = [];

  List<ProductModel> get categoryLenovo => _categoryLenovo;
  List<ProductModel> _categoryLenovo = [];
  List<ProductModel> get categoryOopo => _categoryOopo;
  List<ProductModel> _categoryOopo = [];

  List<ProductModel> get searchResult => _searchResult;
  List<ProductModel> _searchResult = [];
  ValueNotifier<bool> get opened => _opened;
  ValueNotifier<bool> _opened = ValueNotifier(false);

  HomeViewModel() {
    getCategory();
    getProduct();
    getCool();
    getAllProduct();
    getPopular();
    getGategoryPro();
  }

  getCategory() async {
    _loading.value = true;
    HomeService().getCategory().then((value) {
      for (int i = 0; i < value.length; i++) {
        _categoryModel.add(CategoryModel.fromJson(value[i].data()));
        _loading.value = false;
      }
      update();
    });
  }

  getProduct() async {
    _loading.value = true;
    HomeService().getproduct().then((value) {
      for (int i = 0; i < value.length; i++) {
        _productModel.add(ProductModel.fromJson(value[i].data()));
        _loading.value = false;
      }
      update();
    });
  }

  getPopular() async {
    _loading.value = true;
    HomeService().getPopular().then((value) {
      for (int i = 0; i < value.length; i++) {
        _popular.add(ProductModel.fromJson(value[i].data()));
        _loading.value = false;
      }
      update();
    });
  }

  getCool() async {
    _loading.value = true;
    HomeService().getads().then((value) {
      for (int i = 0; i < value.length; i++) {
        _adsModel.add(ProductModel.fromJson(value[i].data()));
        _loading.value = false;
      }
      update();
    });
  }

  getGategoryPro() async {
    _loading.value = true;

    HomeService().getGategoryPro('Apple').then((value) {
      for (int i = 0; i < value.length; i++) {
        _categoryApple.add(ProductModel.fromJson(value[i].data()));
        _loading.value = false;
      }

      update();
    });
    HomeService().getGategoryPro('Samsung').then((value) {
      for (int i = 0; i < value.length; i++) {
        _categorySamsung.add(ProductModel.fromJson(value[i].data()));
        _loading.value = false;
      }

      update();
    });
    HomeService().getGategoryPro('Huawei').then((value) {
      for (int i = 0; i < value.length; i++) {
        _categoryHuawei.add(ProductModel.fromJson(value[i].data()));
        _loading.value = false;
      }

      update();
    });
    HomeService().getGategoryPro('Lenovo').then((value) {
      for (int i = 0; i < value.length; i++) {
        _categoryLenovo.add(ProductModel.fromJson(value[i].data()));
        _loading.value = false;
      }

      update();
    });
    HomeService().getGategoryPro('oopo').then((value) {
      for (int i = 0; i < value.length; i++) {
        _categoryOopo.add(ProductModel.fromJson(value[i].data()));
        _loading.value = false;
      }

      update();
    });
  }

  getAllProduct() async {
    _loading.value = true;
    HomeService().getproduct().then((value) {
      for (int i = 0; i < value.length; i++) {
        _allProduct.add(ProductModel.fromJson(value[i].data()));

        _loading.value = false;
      }

      update();
    });
  }
}
