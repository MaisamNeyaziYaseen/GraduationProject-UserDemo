import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_demo/controller/user_controller.dart';
import 'package:user_demo/model/product.dart';
import 'package:user_demo/utils/ui_constants.dart';
import 'package:user_demo/controller/ui_controller.dart';
import 'package:user_demo/view/main_screens/product_details.dart';

class ProductHolder extends StatefulWidget {
  ProductHolder({super.key, required this.product});
  final Product product;

  @override
  State<ProductHolder> createState() => _ProductHolderState(product: product);
}

class _ProductHolderState extends State<ProductHolder> {
  _ProductHolderState({required this.product});
  final UiController _uiController = Get.find(tag: "ui_controller");
  final UserController _userController = Get.find(tag: "user_controller");
  final Product product;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        // height: MediaQuery.of(context).size.height * 0.3,
        width: MediaQuery.of(context).size.width * 0.4,
        child: Obx(
          () => Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: () {
                  Get.to(() => ProductDetailsScreen(
                        product: product,
                      ));
                },
                child: Container(
                  alignment: Alignment.center,
                  height: MediaQuery.of(context).size.height * 0.2,
                  width: MediaQuery.of(context).size.width * 0.4,
                  decoration: BoxDecoration(
                    color: UiConstants.sndColor,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 7,
                          offset: const Offset(-3, 3))
                    ],
                    image: DecorationImage(
                      image: AssetImage(product.items![0].imgUrls![0]),
                    ),
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.09,
                margin: EdgeInsets.symmetric(horizontal: 10),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: UiConstants.sndColor,
                  borderRadius: BorderRadius.all(Radius.circular(
                      MediaQuery.of(context).size.height *
                          MediaQuery.of(context).size.width *
                          0.0002)),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 7,
                        offset: const Offset(-3, 3))
                  ],
                ),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        onTap: () {
                          Get.to(() => ProductDetailsScreen(product: product));
                        },
                        child: product.items![0].onSale!
                            ? Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "${product.items![0].price}JD".tr,
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontFamily: _uiController.getFont,
                                        decoration: TextDecoration.lineThrough),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "${(product.items![0].price! - product.items![0].price! * product.items![0].saleFactor!).toStringAsFixed(2)}JD"
                                        .tr,
                                    style: TextStyle(
                                        color: Colors.red,
                                        fontFamily: _uiController.getFont),
                                  ),
                                ],
                              )
                            : Text(
                                "${product.items![0].price}JD".tr,
                                style: TextStyle(
                                    fontFamily: _uiController.getFont),
                              ),
                      ),
                      InkWell(
                        onTap: () {
                          if (_userController.getUser.wishList!
                              .any((e) => e == product.id)) {
                            _userController.removeFromWishList(product.id!);
                            setState(() {});
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text(
                              "product removed from your wish list",
                              style: TextStyle(
                                  fontFamily: UiConstants.uiController.getFont),
                            )));
                          } else {
                            _userController.addToWishList(product.id!);
                            setState(() {});
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text(
                              "product added to your wish list",
                              style: TextStyle(
                                  fontFamily: UiConstants.uiController.getFont),
                            )));
                          }
                        },
                        child: _userController.getUser.wishList!
                                .any((e) => e == product.id)
                            ? Icon(
                                Icons.favorite,
                                color: UiConstants.mainColor,
                                shadows: [
                                  Shadow(
                                      color: UiConstants.mainColor,
                                      blurRadius: 30),
                                ],
                              )
                            : Icon(
                                Icons.favorite_outline,
                                color: Colors.white,
                                shadows: [
                                  Shadow(
                                      color: UiConstants.mainColor,
                                      blurRadius: 30),
                                ],
                              ),
                      ),
                    ]),
              )
            ],
          ),
        ));
  }
}
