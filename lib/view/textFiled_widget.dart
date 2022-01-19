import 'package:aqsat/core/viewmodel/home_viewModel.dart';
import 'package:aqsat/core/viewmodel/searchViewModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'details_view.dart';

class Example1 extends StatefulWidget {
  @override
  _Example1State createState() => _Example1State();
}

class _Example1State extends State<Example1> {
  final focusNode = FocusNode();
  final layerLink = LayerLink();
  OverlayEntry? overlayEntry;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      showOverlay();
    });
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        showOverlay();
      } else {
        hideOverlay();
      }
    });
  }

  void showOverlay() async {
    // Declaring and Initializing OverlayState
    // and OverlayEntry objects
    OverlayState? overlayState = Overlay.of(context);

    final renderBox = context.findRenderObject() as RenderBox;
    final size = renderBox.size;
    final offset = renderBox.localToGlobal(Offset.zero);
    overlayEntry = OverlayEntry(builder: (context) {
      // You can return any widget you like here
      // to be displayed on the Overlay
      return Positioned(
        left: offset.dx,
        top: offset.dy + size.height - 200,
        width: size.width,
        child: GetBuilder<HomeViewModel>(
            builder: (controller) => ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Material(
                    child: Builder(builder: (context) {
                      return Container(
                        height: controller.searchResult.isEmpty ? 0 : 200,
                        child: ListView.builder(
                            itemCount: controller.searchResult.length,
                            itemBuilder: (context, index) => Container(
                                  height: 70,
                                  child: Column(
                                    children: [
                                      ListTile(
                                        onTap: () {
                                          Get.to(DetailsView(
                                              model: controller
                                                  .searchResult[index]));
                                          hideOverlay();
                                          focusNode.unfocus();
                                        },
                                        title: Text(controller
                                            .searchResult[index].name),
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
                )),
      );
    });

    // Inserting the OverlayEntry into the Overlay
    overlayState!.insert(overlayEntry!);
  }

  hideOverlay() {
    overlayEntry?.remove();
    overlayEntry = null;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<SearchViewModel>(
        builder: (controller) => Builder(builder: (context) {
          return Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 8,
                ),
                Container(
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
                    focusNode: focusNode,
                    onChanged: (search) {
                      controller.loading.value
                          ? CircularProgressIndicator()
                          : controller.searchForItem(search.toLowerCase());
                      showOverlay();
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
                        hintText: 'Search Mobiles',
                        hintStyle: TextStyle(color: Colors.black38)),
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
