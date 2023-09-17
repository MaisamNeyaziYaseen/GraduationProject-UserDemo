import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_demo/controller/monogdb_controller.dart';
import 'package:user_demo/controller/order_controller.dart';
import 'package:user_demo/controller/product_controller.dart';
import 'package:user_demo/controller/user_controller.dart';
import 'package:user_demo/services/firebase/auth_service.dart';
import 'package:user_demo/utils/ui_constants.dart';
import 'package:user_demo/view/main_screens/get_started/sign_in.dart';

class CustomizedAppBarBuilder {
  static final AuthService _auth = AuthService();

  static updateData() async {
    //update user data
    await Get.find<UserController>(tag: "user_controller").updateUser(
        Get.find<UserController>(tag: "user_controller").getUser.id!,
        Get.find<UserController>(tag: "user_controller").getUser);
    //update orders
    if (Get.find<OrderController>(tag: "order_controller")
        .getOrdersList
        .isNotEmpty) {
      await Get.find<OrderController>(tag: "order_controller").addOrders(
          Get.find<OrderController>(tag: "order_controller").getOrdersList);
    }
  }

  static buildCustomizedAppBar(BuildContext context) => AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: UiConstants.sndColor,
        elevation: 1,
        leading: IconButton(
          onPressed: () async {
            //get data

            await Get.find<ProductController>(tag: "product_controller")
                .retrieveAllProducts();

            await Get.find<OrderController>(tag: "order_controller")
                .retrieveUserOrders(
                    Get.find<UserController>(tag: "user_controller")
                        .getUser
                        .id!);
          },
          icon: Icon(
            Icons.search,
            color: Colors.transparent,
          ),
        ),
        actions: [
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: InkWell(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (c) => SimpleDialog(
                            children: [
                              SimpleDialogOption(
                                onPressed: () {},
                                child: ListTile(
                                  leading: const Icon(Icons.settings_outlined),
                                  title: Text(
                                    "account settings".tr,
                                    style: TextStyle(
                                        fontFamily:
                                            UiConstants.uiController.getFont),
                                  ),
                                ),
                              ),
                              SimpleDialogOption(
                                onPressed: () {
                                  if (UiConstants.uiController.getLocale ==
                                      const Locale("en")) {
                                    UiConstants.uiController
                                        .setLocale(const Locale("ar"));
                                    UiConstants.uiController
                                        .setFont("sst_arabic_roman");
                                    Get.updateLocale(
                                        UiConstants.uiController.getLocale);
                                  } else if (UiConstants
                                          .uiController.getLocale ==
                                      const Locale("ar")) {
                                    UiConstants.uiController
                                        .setLocale(const Locale("en"));
                                    UiConstants.uiController
                                        .setFont("varela_round");
                                    Get.updateLocale(
                                        UiConstants.uiController.getLocale);
                                  }
                                },
                                child: ListTile(
                                  leading: Icon(Icons.language),
                                  title: Text(
                                    "change language".tr,
                                    style: TextStyle(
                                        fontFamily:
                                            UiConstants.uiController.getFont),
                                  ),
                                ),
                              ),
                              SimpleDialogOption(
                                onPressed: () async {
                                  //sign out
                                  await _auth.signOut((e) {
                                    //on exception
                                    print(e);
                                  }, () {
                                    //on sign out
                                    //go to SignInScreen
                                    //user signed out
                                    //upadte data
                                    updateData();
                                    Get.find<MongoDbController>(
                                            tag: "mongodb_controller")
                                        .setFetchData(true);
                                    Get.offAll(() => SignInScreen());
                                  });
                                },
                                child: ListTile(
                                  leading: Icon(Icons.exit_to_app_outlined),
                                  title: Text(
                                    "sign out".tr,
                                    style: TextStyle(
                                        color: Colors.red,
                                        fontFamily:
                                            UiConstants.uiController.getFont),
                                  ),
                                ),
                              ),
                            ],
                          ));
                },
                child: Icon(
                  Icons.settings_outlined,
                  color: Colors.black,
                ),
              ))
        ],
      );
}
