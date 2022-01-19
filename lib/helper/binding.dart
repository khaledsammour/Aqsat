import 'package:aqsat/core/viewmodel/admin/adminAqsatViewModel.dart';
import 'package:aqsat/core/viewmodel/auth_view_model.dart';
import 'package:aqsat/core/viewmodel/aqsatViewModel.dart';
import 'package:aqsat/core/viewmodel/adressViewModel.dart';
import 'package:aqsat/core/viewmodel/control_viewModel.dart';
import 'package:aqsat/core/viewmodel/home_viewModel.dart';
import 'package:aqsat/helper/internetConnection.dart';
import 'package:aqsat/helper/local_storageData.dart';
import 'package:get/get.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthViewModel>(() => AuthViewModel());
    Get.lazyPut<ControlViewModel>(() => ControlViewModel());
    Get.lazyPut<HomeViewModel>(() => HomeViewModel());
    Get.lazyPut<AqsatViewModel>(() => AqsatViewModel());
    Get.lazyPut<LocalStorageData>(() => LocalStorageData());
    Get.lazyPut<AddressViewModel>(() => AddressViewModel());
    Get.lazyPut<AdminAqsatViewModel>(() => AdminAqsatViewModel());
    Get.lazyPut<GetXNetworkManager>(() => GetXNetworkManager());
  }
}
