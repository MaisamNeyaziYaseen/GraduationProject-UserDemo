import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_demo/controller/order_controller.dart';
import 'package:user_demo/controller/user_controller.dart';
import 'package:user_demo/utils/ui_constants.dart';
import 'package:user_demo/view/components/customized_app_bar.dart';
import 'package:user_demo/view/components/glasses_details.dart';
import 'package:user_demo/view/main_screens/order_now.dart';
import '../components/customized_bottom_navigation_bar.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final UserController _userController = Get.find(tag: "user_controller");
  OrderController _orderController = Get.find(tag: "order_controller");

  @override
  void initState() {
    super.initState();
    print("in init state");
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _calculateTotal();
    });
  }

  _calculateTotal() {
    double total = 0.0;
    _userController.getUser.cartList!.forEach((e) {
      if (e['type'] == "Sunglasses") {
        if (e['item']['on_sale']) {
          total += (e['item']['price'] -
                  e['item']['price'] * e['item']['sale_factor']) *
              e['quantity'];
        } else {
          total += e['item']['price'] * e['quantity'];
        }
      } else if (e['type'] == "Glasses") {
        if (e['item']['on_sale']) {
          total += ((e['item']['price'] -
                      e['item']['price'] * e['item']['sale_factor'] +
                      e['lenses_price']) -
                  ((e['item']['price'] -
                          e['item']['price'] * e['item']['sale_factor'] +
                          e['lenses_price'])) *
                      e['item']['sale_factor']) *
              e['quantity'];
          print(((e['item']['price'] -
                      e['item']['price'] * e['item']['sale_factor'] +
                      e['lenses_price']) -
                  (e['item']['price'] -
                          e['item']['price'] * e['item']['sale_factor'] +
                          e['lenses_price']) *
                      e['item']['sale_factor']) *
              e['quantity']);
        } else {
          total += (e['item']['price'] + e['lenses_price']) * e['quantity'];
        }
      }
    });

    _orderController.setTotal(total);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomizedAppBarBuilder.buildCustomizedAppBar(context),
      body: SafeArea(
          child: Obx(
        () => Column(children: [
          Container(
            alignment: UiConstants.uiController.getLocale == const Locale("en")
                ? Alignment.centerLeft
                : Alignment.centerRight,
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.07,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            color: UiConstants.sndColor,
            child: Text(
              "products".tr,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: UiConstants.uiController.getFont),
            ),
          ),
          Expanded(
            child: Obx(
              () => ListView.builder(
                  itemCount: _userController.getUser.cartList!
                      .toList()
                      .length, //cartProducts length
                  itemBuilder: (c, i) => Column(
                        children: [
                          Container(
                            width: double.infinity,
                            margin: EdgeInsets.symmetric(vertical: 10),
                            height: MediaQuery.of(context).size.height * 0.15,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  width:
                                      MediaQuery.of(context).size.width * 0.3,
                                  decoration: BoxDecoration(
                                      color: UiConstants.sndColor,
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          image: AssetImage(_userController
                                                  .getUser.cartList!
                                                  .toList()[i]["item"]
                                              ['img_urls'][0])),
                                      boxShadow: [
                                        BoxShadow(
                                            color:
                                                Colors.black.withOpacity(0.1),
                                            blurRadius: 7,
                                            offset: Offset(-3, 3))
                                      ]),
                                ),
                                _userController.getUser.cartList!.toList()[i]
                                        ['item']['on_sale']
                                    ? SizedBox(
                                        width: 120,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            _userController.getUser.cartList!
                                                        .toList()[i]['type'] ==
                                                    "Glasses"
                                                ? Text(
                                                    "${_userController.getUser.cartList!.toList()[i]['lenses_type']}/${_userController.getUser.cartList!.toList()[i]['lenses_subtype']}: ${_userController.getUser.cartList!.toList()[i]['lenses_price']}JD",
                                                    style: TextStyle(
                                                        color: Colors.grey),
                                                  )
                                                : Container(),
                                            Text(
                                              "${_userController.getUser.cartList!.toList()[i]['item']['price']}JD"
                                                  .tr,
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  decoration: TextDecoration
                                                      .lineThrough),
                                            ),
                                            Text(
                                              "${(_userController.getUser.cartList!.toList()[i]['item']['price'] - _userController.getUser.cartList!.toList()[i]['item']['price'] * _userController.getUser.cartList!.toList()[i]['item']['sale_factor']).toStringAsFixed(2)}JD"
                                                  .tr,
                                              style: TextStyle(
                                                color: Colors.red,
                                              ),
                                            ),
                                            _userController.getUser.cartList!
                                                                .toList()[i]
                                                            ['type'] ==
                                                        "Glasses" &&
                                                    (_userController.getUser
                                                                    .cartList!
                                                                    .toList()[i]
                                                                [
                                                                'lenses_type'] ==
                                                            "Prescription" ||
                                                        _userController.getUser
                                                                    .cartList!
                                                                    .toList()[i]
                                                                [
                                                                'lenses_type'] ==
                                                            "Reading Lenses")
                                                ? InkWell(
                                                    onTap: () {
                                                      Get.to(() => GlassesDetails(
                                                          item: _userController
                                                              .getUser.cartList!
                                                              .toList()[i]));
                                                    },
                                                    child: Text(
                                                      "show details",
                                                      style: TextStyle(
                                                          color: UiConstants
                                                              .mainColor),
                                                    ))
                                                : Container()
                                          ],
                                        ),
                                      )
                                    : SizedBox(
                                        width: 120,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            _userController.getUser.cartList!
                                                        .toList()[i]['type'] ==
                                                    "Glasses"
                                                ? Text(
                                                    "${_userController.getUser.cartList!.toList()[i]['lenses_type']}/${_userController.getUser.cartList!.toList()[i]['lenses_subtype']}: ${_userController.getUser.cartList!.toList()[i]['lenses_price']}JD",
                                                    style: TextStyle(
                                                        color: Colors.grey),
                                                  )
                                                : Container(),
                                            Text(
                                              "${(_userController.getUser.cartList!.toList()[i]['item']['price'])}JD"
                                                  .tr,
                                            ),
                                            _userController.getUser.cartList!
                                                                .toList()[i]
                                                            ['type'] ==
                                                        "Glasses" &&
                                                    (_userController.getUser
                                                                    .cartList!
                                                                    .toList()[i]
                                                                [
                                                                'lenses_type'] ==
                                                            "Prescription" ||
                                                        _userController.getUser
                                                                    .cartList!
                                                                    .toList()[i]
                                                                [
                                                                'lenses_type'] ==
                                                            "Reading Lenses")
                                                ? Column(
                                                    children: [
                                                      SizedBox(
                                                        height: 20,
                                                      ),
                                                      InkWell(
                                                          onTap: () {
                                                            Get.to(() => GlassesDetails(
                                                                item: _userController
                                                                    .getUser
                                                                    .cartList!
                                                                    .toList()[i]));
                                                          },
                                                          child: Text(
                                                            "show details",
                                                            style: TextStyle(
                                                                color: UiConstants
                                                                    .mainColor),
                                                          )),
                                                    ],
                                                  )
                                                : Container()
                                          ],
                                        ),
                                      ),
                                SizedBox(
                                  width: 20,
                                ),
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.06,
                                  width:
                                      MediaQuery.of(context).size.width * 0.3,
                                  decoration: BoxDecoration(
                                      color: UiConstants.sndColor,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.06) *
                                              MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.3 *
                                              0.006),
                                      boxShadow: [
                                        BoxShadow(
                                            color:
                                                Colors.black.withOpacity(0.1),
                                            blurRadius: 7,
                                            offset: Offset(-3, 3))
                                      ]),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      IconButton(
                                          onPressed: () {
                                            _userController.repeatToCartList(i);
                                            _calculateTotal();
                                            setState(() {});
                                          },
                                          icon: Icon(Icons.add)),
                                      Text(
                                          "${_userController.getUser.cartList!.toList()[i]['quantity']}"),
                                      IconButton(
                                          onPressed: () {
                                            _userController
                                                .removefromCartList(i);
                                            _calculateTotal();
                                            setState(() {});
                                          },
                                          icon: Icon(Icons.remove))
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          Divider(
                            thickness: 1,
                          ),
                        ],
                      )),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.1,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(color: UiConstants.sndColor, boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.5),
              )
            ]),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${_orderController.getTotal.toStringAsFixed(2)}JD",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: UiConstants.uiController.getFont),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: StadiumBorder(),
                      elevation: 0,
                      backgroundColor: UiConstants.mainColor),
                  onPressed: () {
                    Get.to(() => OrderNow());
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width * 0.3,
                    height: MediaQuery.of(context).size.height * 0.06,
                    child: Text(
                      "order now".tr,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16 * UiConstants.textScaleFactor,
                          fontFamily: UiConstants.uiController.getFont),
                    ),
                  ),
                )
              ],
            ),
          ),
        ]),
      )),
      bottomNavigationBar: CustomizedBottomNavigationBar(),
    );
  }
}
