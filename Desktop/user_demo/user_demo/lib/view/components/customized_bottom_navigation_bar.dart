import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_demo/controller/monogdb_controller.dart';
import 'package:user_demo/utils/ui_constants.dart';
import 'package:user_demo/view/main_screens/account.dart';
import 'package:user_demo/view/main_screens/cart.dart';
import 'package:user_demo/view/main_screens/categories.dart';
import 'package:user_demo/view/main_screens/home.dart';
import 'package:user_demo/view/main_screens/services.dart';

class CustomizedBottomNavigationBar extends StatelessWidget {
  CustomizedBottomNavigationBar({super.key});
  final List<IconData> _icons = [
    Icons.menu,
    Icons.sentiment_satisfied_rounded,
    Icons.shopping_bag_outlined,
    Icons.person_outline
  ];
  final List<String> _lables = ["categories", "services", "cart", "account"];
  navigate(int v) {
    switch (v) {
      case 0:
        Get.to(() => CategoriesScreen());
        break;
      case 1:
        Get.to(() => ServicesScreen());
        break;
      case 2:
        Get.to(() => CartScreen());
        break;
      case 3:
        Get.to(() => AccountScreen());
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.13,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.08,
                margin: const EdgeInsets.symmetric(horizontal: 5),
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.7),
                    borderRadius: BorderRadius.all(Radius.circular(
                        MediaQuery.of(context).size.height *
                            0.07 *
                            (MediaQuery.of(context).size.height - 40) *
                            0.0009))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.08,
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: _icons.length ~/ 2, //??
                          itemBuilder: (c, i) => Obx(
                                () => InkWell(
                                  onTap: () {
                                    UiConstants.uiController
                                        .setNavigationBarIndex(i);
                                    //navigate to the targeted screen
                                    navigate(UiConstants
                                        .uiController.getNavigationBarIndex);
                                  },
                                  child: SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.07,
                                    width: MediaQuery.of(context).size.width *
                                        0.3 /
                                        2.0,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Icon(
                                          _icons[i],
                                          color: UiConstants.uiController
                                                      .getNavigationBarIndex ==
                                                  i
                                              ? Colors.white
                                              : Colors.grey,
                                        ),
                                        Text(
                                          _lables[i].tr,
                                          style: TextStyle(
                                              color: UiConstants.uiController
                                                          .getNavigationBarIndex ==
                                                      i
                                                  ? Colors.white
                                                  : Colors.grey,
                                              fontFamily: UiConstants
                                                  .uiController.getFont,
                                              fontSize: 7 *
                                                  UiConstants.textScaleFactor),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )),
                    ),
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.08,
                        width: MediaQuery.of(context).size.width * 0.3,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: _icons.length ~/ 2,
                            itemBuilder: (c, i) => Obx(
                                  () => InkWell(
                                    onTap: () {
                                      UiConstants.uiController
                                          .setNavigationBarIndex(i + 2);
                                      //navigate to the targeted screen
                                      navigate(UiConstants
                                          .uiController.getNavigationBarIndex);
                                    },
                                    child: SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.07,
                                      width: MediaQuery.of(context).size.width *
                                          0.3 /
                                          2.0,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Icon(
                                            _icons[i + 2],
                                            color: UiConstants.uiController
                                                        .getNavigationBarIndex ==
                                                    i + 2
                                                ? Colors.white
                                                : Colors.grey,
                                          ),
                                          Text(
                                            _lables[i + 2].tr,
                                            style: TextStyle(
                                                color: UiConstants.uiController
                                                            .getNavigationBarIndex ==
                                                        i + 2
                                                    ? Colors.white
                                                    : Colors.grey,
                                                fontFamily: UiConstants
                                                    .uiController.getFont,
                                                fontSize: 7 *
                                                    UiConstants
                                                        .textScaleFactor),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ))),
                  ],
                ),
              ),
              Obx(
                () => InkWell(
                  onTap: () {
                    UiConstants.uiController.setNavigationBarIndex(4);
                    //go to home
                    Get.to(() => HomeScreen());
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width * 0.2,
                    height: MediaQuery.of(context).size.height * 0.1,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(
                          MediaQuery.of(context).size.height *
                              0.1 *
                              MediaQuery.of(context).size.width *
                              0.2 *
                              0.008)),
                      boxShadow: [
                        BoxShadow(
                          color:
                              UiConstants.uiController.getNavigationBarIndex ==
                                      4
                                  ? UiConstants.mainColor.withOpacity(0.5)
                                  : Colors.black.withOpacity(0.5),
                          blurRadius: 8,
                          spreadRadius: 4,
                        )
                      ],
                    ),
                    child: const Text("logo"),
                  ),
                ),
              )
            ],
          ),
        ),
        Obx(
          () => Get.find<MongoDbController>(tag: "mongodb_controller")
                  .getIsFetchingData
              ? Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.13,
                  color: Colors.black.withOpacity(0.5),
                )
              : Container(
                  height: MediaQuery.of(context).size.height * 0.13,
                ),
        )
      ],
    );
  }
}
