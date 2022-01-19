import 'package:aqsat/core/viewmodel/admin/adminProfileViewModel.dart';
import 'package:aqsat/view/admin/editProductDetailView.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProductView extends StatelessWidget {
  const EditProductView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
      ),
      body: SingleChildScrollView(
        child: GetBuilder<AdminProfileViewModel>(
          builder: (controller) => ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Material(
              child: Container(
                height: 500,
                child: ListView.builder(
                    itemCount: controller.productModel.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Get.to(EditProductDetailsView(
                              model: controller.productModel[index]));
                        },
                        child: Container(
                          decoration: BoxDecoration(),
                          height: 70,
                          child: ListTile(
                            trailing: Image.network(
                                controller.productModel[index].img),
                            title: Text(controller.productModel[index].name),
                          ),
                        ),
                      );
                    }),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
