import 'package:aqsat/constance.dart';
import 'package:aqsat/core/viewmodel/adressViewModel.dart';
import 'package:aqsat/model/productModel.dart';
import 'package:aqsat/view/checkout/buy_view.dart';
import 'package:aqsat/view/widget/custom_butoon.dart';
import 'package:aqsat/view/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddressView extends StatelessWidget {
  ProductModel model;
  AddressView({required this.model});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddressViewModel>(
      init: AddressViewModel(),
      builder: (controller) => controller.loading.value
          ? Center(child: CircularProgressIndicator())
          : Scaffold(
              backgroundColor: Colors.white,
              body: Container(
                height: double.infinity,
                width: double.infinity,
                child: Stack(
                  children: [
                    GoogleMap(
                      zoomControlsEnabled: true,
                      mapType: MapType.normal,
                      myLocationEnabled: true,
                      myLocationButtonEnabled: false,
                      initialCameraPosition: CameraPosition(
                          target: LatLng(
                              controller.vlatitude, controller.vlongitude),
                          zoom: controller.zoom),
                      onMapCreated: (GoogleMapController googleMapController) {
                        controller.onMapCreated();
                        controller.mapController = googleMapController;
                      },
                      markers: controller.myMarker,
                      onCameraMove: (v) {
                        controller.onCameraMove(
                            v.target.latitude, v.target.longitude);
                      },
                    ),
                    Positioned(
                      left: 10,
                      top: 30,
                      child: Container(
                        height: 50,
                        width: 50,
                        alignment: Alignment.topLeft,
                        child: IconButton(
                          icon: Icon(Icons.arrow_back_ios_new),
                          onPressed: () {
                            Get.back();
                          },
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 30,
                      left: 10,
                      right: 60,
                      child: Container(
                        height: 70,
                        child: CustomButton(
                            title: 'Choose Current Location',
                            onPressed: () {
                              if (controller.firelatitude != null) {
                                Get.to(BuyView(
                                  model: model,
                                  latitude: controller.firelatitude,
                                  longitude: controller.firelongitude,
                                ));
                              } else {
                                Get.snackbar(
                                    'Location', 'Please Choose a location');
                              }
                            }),
                      ),
                    ),
                    Positioned(
                      bottom: 110,
                      left: MediaQuery.of(context).size.width - 60,
                      right: 10,
                      child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              color: primaryColor,
                              borderRadius: BorderRadius.circular(20)),
                          child: IconButton(
                            icon: Icon(
                              Icons.location_on,
                              color: Colors.red,
                            ),
                            onPressed: () {
                              controller.getCurrentLocation();
                              controller.getCurrentLocation();
                              controller.moveCamera(controller.vlatitude,
                                  controller.vlongitude, 18.0);
                            },
                          )),
                    ),
                  ],
                ),
              )),
    );
  }
}
