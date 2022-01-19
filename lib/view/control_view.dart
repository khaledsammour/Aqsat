import 'package:aqsat/core/viewmodel/auth_view_model.dart';
import 'package:aqsat/core/viewmodel/control_viewModel.dart';
import 'package:aqsat/helper/internetConnection.dart';
import 'package:aqsat/view/auth/login.dart';
import 'package:aqsat/view/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ControlView extends GetWidget<AuthViewModel> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return (Get.find<AuthViewModel>().user == null)
          ? Login()
          : GetBuilder<GetXNetworkManager>(
              builder: (builder) => (builder.connectionType == 0)
                  ? CustomText(
                      title: "No Connection",
                      alignment: Alignment.center,
                    )
                  : GetBuilder<ControlViewModel>(
                      init: ControlViewModel(),
                      builder: (controller) => Scaffold(
                        body: controller.currentScreen,
                        bottomNavigationBar: bottomNavigatorBar(),
                      ),
                    ));
    });
  }

  Widget bottomNavigatorBar() {
    return GetBuilder<ControlViewModel>(
      init: ControlViewModel(),
      builder: (controller) => Container(
        height: 58,
        child: Column(
          children: [
            Container(
              height: 1,
              color: Colors.grey.withOpacity(0.4),
            ),
            BottomNavigationBar(
                items: [
                  BottomNavigationBarItem(
                    activeIcon: Text("Home"),
                    label: "",
                    icon: Icon(
                      Icons.home,
                    ),
                  ),
                  BottomNavigationBarItem(
                    activeIcon: Text("Aqsat"),
                    label: "",
                    icon: Icon(
                      Icons.shopping_cart,
                    ),
                  ),
                  BottomNavigationBarItem(
                    activeIcon: Text("Account"),
                    label: "",
                    icon: Icon(
                      Icons.person,
                    ),
                  ),
                ],
                selectedItemColor: Colors.black,
                backgroundColor: Colors.grey.shade50,
                elevation: 0,
                currentIndex: controller.navigatorValue,
                onTap: (index) => controller.changeSelectedValue(index)),
          ],
        ),
      ),
    );
  }
}
