import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:user_demo/controller/product_controller.dart';
import 'package:user_demo/controller/user_controller.dart';
import 'package:user_demo/utils/ui_constants.dart';
import 'package:user_demo/controller/ui_controller.dart';
import 'package:user_demo/view/components/account_section.dart';
import 'package:user_demo/view/components/customized_app_bar.dart';
import '../components/customized_bottom_navigation_bar.dart';

class AccountScreen extends StatelessWidget {
  AccountScreen({super.key});

  final UiController uiController = Get.find(tag: "ui_controller");
  final UserController _userController = Get.find(tag: "user_controller");
  ProductController _productController = Get.find(tag: "product_controller");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomizedAppBarBuilder.buildCustomizedAppBar(context),
      body: SlidingUpPanel(
        minHeight: MediaQuery.of(context).size.height * 0.37,
        maxHeight: MediaQuery.of(context).size.height * 0.55,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AccountSection.buildAccountSection(
              "orders",
              const ["In-Process", "Delivered"],
            ),
            AccountSection.buildAccountSection(
              "me",
              const ["diagnoses", "appointments"],
            ),
          ],
        ),
        panelBuilder: (controller) => Column(
          children: [
            Container(
              alignment: Alignment.center,
              height: MediaQuery.of(context).size.height * 0.1,
              decoration: BoxDecoration(
                color: UiConstants.sndColor,
                border: const Border(
                  bottom: BorderSide(width: 0.1),
                ),
              ),
              child: Text(
                "wish list".tr,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: uiController.getFont),
              ),
            ),
            Expanded(
                child: Obx(
              () => _userController.getUser.wishList!.isEmpty
                  ? Column(
                      children: [
                        SizedBox(
                          height: 50,
                        ),
                        Text(
                          "yor wish list is empty",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20),
                        ),
                        Text(
                          "discover our products\nand keep your favorits here",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                      ],
                    )
                  : ListView.builder(
                      controller: controller,
                      itemCount: _userController
                          .getUser.wishList!.length, //wishList length
                      itemBuilder: (c, i) => Container(
                        height: MediaQuery.of(context).size.height * 0.2,
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          color: UiConstants.sndColor,
                          border: const Border(bottom: BorderSide(width: 0.1)),
                        ),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                alignment: Alignment.center,
                                width: MediaQuery.of(context).size.width * 0.3,
                                height:
                                    MediaQuery.of(context).size.height * 0.15,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(_productController
                                        .getProductsList()
                                        .firstWhere((p) =>
                                            p.id ==
                                            _userController.getUser.wishList!
                                                .toList()[i])
                                        .items![0]
                                        .imgUrls![0]),
                                  ),
                                  color: UiConstants.sndColor,
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black.withOpacity(0.1),
                                        blurRadius: 7,
                                        offset: Offset(-3, 3))
                                  ],
                                ),
                              ),
                              Text(
                                  "${_productController.getProductsList().firstWhere((p) => p.id == _userController.getUser.wishList!.toList()[i]).items![0].price}\$"),
                              const SizedBox(
                                width: 50,
                              ),
                              TextButton(
                                  onPressed: () {
                                    //remove product for wish list
                                  },
                                  child: Text(
                                    "remove".tr,
                                    style: TextStyle(
                                        color: UiConstants.mainColor,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: uiController.getFont),
                                  ))
                            ]),
                      ),
                    ),
            )),
          ],
        ),
      ),
      bottomNavigationBar: CustomizedBottomNavigationBar(),
    );
  }
}
