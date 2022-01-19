import 'package:animations/animations.dart';
import 'package:aqsat/core/viewmodel/home_viewModel.dart';
import 'package:aqsat/core/viewmodel/searchViewModel.dart';
import 'package:aqsat/presentation/resource/strings_manager.dart';
import 'package:aqsat/view/product_view.dart';
import 'package:aqsat/view/textFiled_widget.dart';
import 'package:aqsat/view/widget/custom_butoon.dart';
import 'package:aqsat/view/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../constance.dart';
import 'category_view.dart';
import 'details_view.dart';

class HomeView extends StatelessWidget {
  List<int> colors = [0xfff36417, 0xfff6740f9];
  final layerLink = LayerLink();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
        init: HomeViewModel(),
        builder: (controller) => Scaffold(
              body: controller.loading.value
                  ? Center(
                      child: CircularProgressIndicator(
                        color: Colors.red,
                      ),
                    )
                  : _build(),
            ));
  }

  Widget _build() {
    return GetBuilder<HomeViewModel>(
        builder: (controller) => Builder(builder: (context) {
              return SafeArea(
                child: GestureDetector(
                  child: Container(
                    height: double.infinity,
                    width: double.infinity,
                    child: Stack(children: [
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            // _search(),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * .1,
                            ),
                            _animationCoolProduct(),
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: CustomText(
                                title: AppStrings.popularBrand,
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * .1 - 50,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: _animationListCategory(),
                            ),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * .1 - 50,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomText(
                                    title: AppStrings.popularProduct,
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Get.to(ProductView());
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 10),
                                      child: Container(
                                        height: 20,
                                        width: 60,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.grey.shade200),
                                            color: Color(0xfff8f8f8),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey.shade400
                                                    .withOpacity(0.5),
                                                spreadRadius: 2,
                                                blurRadius: 20,
                                                offset: Offset(0,
                                                    3), // changes position of shadow
                                              ),
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(30)),
                                        child: CustomText(
                                          alignment: Alignment.center,
                                          title: AppStrings.more,
                                          color: primaryColor,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * .1 - 50,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: _animationListProduct(),
                            )
                          ],
                        ),
                      ),
                      /*CompositedTransformFollower(
                        link: layerLink,
                        offset: Offset(0, 80),
                        child: GetBuilder<SearchViewModel>(
                            init: SearchViewModel(),
                            builder: (controller) => Material(
                                  child: Container(
                                    height: controller.height,
                                    width: controller.width,
                                    decoration: BoxDecoration(),
                                    child: ListView.builder(
                                        itemCount:
                                            controller.searchResult.length,
                                        itemBuilder: (context, index) =>
                                            Container(
                                              height: 70,
                                              child: Column(
                                                children: [
                                                  ListTile(
                                                    onTap: () {
                                                      Get.to(
                                                        DetailsView(
                                                            model: controller
                                                                    .searchResult[
                                                                index]),
                                                      );
                                                      controller.closeSearch();
                                                    },
                                                    title: Text(controller
                                                        .searchResult[index]
                                                        .name),
                                                    trailing: Image.network(
                                                        controller
                                                            .searchResult[index]
                                                            .img),
                                                  ),
                                                  Divider(
                                                    height: 5,
                                                  )
                                                ],
                                              ),
                                            )),
                                  ),
                                )),
                      ),*/

                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: GetBuilder<SearchViewModel>(
                            init: SearchViewModel(),
                            builder: (controller) => FloatingSearchBar(
                                  elevation: 10,
                                  onFocusChanged: (value) {
                                    controller.searchResult.clear();
                                  },
                                  clearQueryOnClose: true,
                                  onQueryChanged: (search) {
                                    controller.loading.value
                                        ? CircularProgressIndicator()
                                        : controller.searchForItem(
                                            search.toLowerCase());
                                    controller.searchResult.clear();
                                  },
                                  transitionCurve: Curves.easeInOutCubic,
                                  transition:
                                      CircularFloatingSearchBarTransition(),
                                  physics: const BouncingScrollPhysics(),
                                  builder: (context, _) => buildBody(),
                                )),
                      ),
                    ]),
                  ),
                ),
              );
            }));
  }

  Widget _search() {
    return GetBuilder<SearchViewModel>(
      init: SearchViewModel(),
      builder: (controller) => Builder(builder: (context) {
        return CompositedTransformTarget(
          link: layerLink,
          child: Container(
            margin: EdgeInsets.only(left: 0, top: 8),
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black26,
                      blurRadius: 6,
                      offset: Offset(0, 2))
                ]),
            height: 60,
            width: MediaQuery.of(context).size.width - 50,
            child: TextField(
              onEditingComplete: () => controller.closeSearch(),
              onChanged: (search) {
                controller.openSearch(context);
                controller.searchForItem(search.toLowerCase());
                controller.searchResult.clear();
              },
              keyboardType: TextInputType.name,
              style: TextStyle(color: Colors.black87),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(top: 14),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),
                  hintText: AppStrings.searchMobiles,
                  hintStyle: TextStyle(color: Colors.black38)),
            ),
          ),
        );
      }),
    );
  }

  Widget buildBody() {
    return GetBuilder<SearchViewModel>(
        builder: (controller) => ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Material(
                child: Builder(builder: (context) {
                  return Container(
                    height: MediaQuery.of(context).size.height * 0.5,
                    child: ListView.builder(
                        itemCount: controller.searchResult.length,
                        itemBuilder: (context, index) => Container(
                              height: 70,
                              child: Column(
                                children: [
                                  ListTile(
                                    onTap: () {
                                      Get.to(DetailsView(
                                          model:
                                              controller.searchResult[index]));
                                    },
                                    title: Text(
                                        controller.searchResult[index].name),
                                    trailing: Image.network(
                                        controller.searchResult[index].img),
                                  ),
                                  Container(
                                    height: 1,
                                    color: Colors.grey.shade300,
                                  )
                                ],
                              ),
                            )),
                  );
                }),
              ),
            ));
  }

  _animationCoolProduct() {
    return GetBuilder<HomeViewModel>(
        builder: (controller) => Container(
              height: 200,
              child: CarouselSlider.builder(
                itemCount: controller.adsModel.length,
                options: CarouselOptions(
                  aspectRatio: 2.0,
                  enlargeCenterPage: true,
                  enableInfiniteScroll: false,
                  initialPage: 0,
                  autoPlay: false,
                ),
                itemBuilder: (BuildContext context, int index, int realIndex) {
                  return OpenContainer(
                      transitionDuration: Duration(milliseconds: 400),
                      closedColor: Color(0xfff8f8f8).withOpacity(0),
                      openColor: primaryColor,
                      closedElevation: 0,
                      transitionType: ContainerTransitionType.fadeThrough,
                      closedBuilder: (_, openContainer) {
                        return Container(
                          child: Stack(children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Container(
                                height: 150,
                                width:
                                    MediaQuery.of(context).size.width * 1 + 30,
                                decoration: BoxDecoration(
                                    color: Color(colors[index]),
                                    borderRadius: BorderRadius.circular(20)),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Text(
                                        controller.adsModel[index].name,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 30,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 40,
                                      ),
                                      Container(
                                        height: 40,
                                        width: 100,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(30)),
                                        child: Center(
                                          child: Text(
                                            AppStrings.getNow,
                                            style: TextStyle(
                                                color: Colors.red,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 200),
                              height:
                                  MediaQuery.of(context).size.height * 0.2 + 20,
                              width: MediaQuery.of(context).size.width * 1,
                              child: Image.network(
                                controller.adsModel[index].img,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ]),
                        );
                      },
                      openBuilder: (_, __) {
                        return DetailsView(
                          model: controller.adsModel[index],
                        );
                      });
                },
              ),
            ));
  }

  _animationListCategory() {
    return GetBuilder<HomeViewModel>(
      builder: (controller) => Container(
        height: 100,
        child: ListView.separated(
          itemCount: controller.categoryModel.length,
          scrollDirection: Axis.horizontal,
          separatorBuilder: (context, index) => SizedBox(
            width: 20,
          ),
          itemBuilder: (context, index) {
            return OpenContainer(
              transitionDuration: Duration(milliseconds: 400),
              closedColor: Color(0xfff8f8f8).withOpacity(0),
              closedElevation: 0,
              openColor: primaryColor,
              transitionType: ContainerTransitionType.fadeThrough,
              closedBuilder: (_, openContainer) {
                return Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.grey.shade100,
                      ),
                      height: 60,
                      width: 60,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child:
                            Image.network(controller.categoryModel[index].img),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomText(
                      title: controller.categoryModel[index].name,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                );
              },
              openBuilder: (_, __) {
                return controller.categoryModel[index].name == 'Apple'
                    ? CategoryView(
                        model: controller.categoryModel[index],
                        productModel: controller.categoryApple,
                      )
                    : controller.categoryModel[index].name == 'Samsung'
                        ? CategoryView(
                            model: controller.categoryModel[index],
                            productModel: controller.categorySamsung,
                          )
                        : controller.categoryModel[index].name == 'Huawei'
                            ? CategoryView(
                                model: controller.categoryModel[index],
                                productModel: controller.categoryHuawei,
                              )
                            : controller.categoryModel[index].name == 'Lenovo'
                                ? CategoryView(
                                    model: controller.categoryModel[index],
                                    productModel: controller.categoryLenovo,
                                  )
                                : controller.categoryModel[index].name == 'oopo'
                                    ? CategoryView(
                                        model: controller.categoryModel[index],
                                        productModel: controller.categoryOopo,
                                      )
                                    : Container(
                                        height: 0,
                                        width: 0,
                                      );
              },
            );
          },
        ),
      ),
    );
  }

  _animationListProduct() {
    return GetBuilder<HomeViewModel>(
        builder: (controller) => Container(
              height: 250,
              child: ListView.separated(
                separatorBuilder: (context, index) => SizedBox(
                  width: 13,
                ),
                itemCount: controller.popular.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return OpenContainer(
                    transitionDuration: Duration(milliseconds: 400),
                    closedColor: Color(0xfff8f8f8).withOpacity(0),
                    closedElevation: 0,
                    openColor: primaryColor,
                    transitionType: ContainerTransitionType.fadeThrough,
                    closedBuilder: (_, openContainer) {
                      return Stack(children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 30, left: 5),
                          child: Container(
                            height: 200,
                            width: 150,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 1,
                                    blurRadius: 5,
                                    offset: Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(30)),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 90,
                                  ),
                                  CustomText(
                                    title: controller.popular[index].name,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  CustomText(
                                    title:
                                        controller.popular[index].monthlyPay +
                                            ' JOD',
                                    fontWeight: FontWeight.bold,
                                    color: priceColor,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 8),
                                    child: Container(
                                        height: 45,
                                        width: 130,
                                        child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              color: Colors.grey.shade400,
                                            ),
                                            child: CustomText(
                                              title: 'See More',
                                              alignment: Alignment.center,
                                              color: Color(0xff282630),
                                            ))),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 0),
                          child: Container(
                            width: 140,
                            height: 110,
                            child: Image.network(
                              controller.popular[index].img,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ]);
                    },
                    openBuilder: (_, __) {
                      return DetailsView(model: controller.popular[index]);
                    },
                  );
                },
              ),
            ));
  }
}
