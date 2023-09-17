import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_demo/controller/monogdb_controller.dart';
import 'package:user_demo/controller/order_controller.dart';
import 'package:user_demo/controller/product_controller.dart';
import 'package:user_demo/controller/ui_controller.dart';
import 'package:user_demo/controller/user_controller.dart';
import 'package:user_demo/utils/ui_constants.dart';
import 'package:user_demo/view/components/customized_app_bar.dart';
import 'package:user_demo/view/components/customized_bottom_navigation_bar.dart';
import 'package:user_demo/view/components/product_holder.dart';
import 'package:scroll_loop_auto_scroll/scroll_loop_auto_scroll.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final UiController _uiController = Get.find(tag: "ui_controller");
  final UserController _userController = Get.find(tag: "user_controller");
  final MongoDbController _mongoDbController =
      Get.find(tag: "mongodb_controller");
  final ProductController _productController =
      Get.find(tag: "product_controller");
  final OrderController _orderController = Get.find(tag: "order_controller");
  _fetchData() async {
    _mongoDbController.setIsFetchingData(true);
    await _userController.retrieveUserByEmail(_userController.getEmail);
    await _productController.retrieveAllProducts();
    await _orderController.retrieveUserOrders(_userController.getUser.id!);

    _mongoDbController.setIsFetchingData(false);
    _mongoDbController.setFetchData(false);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
      "welcome :)",
      style: TextStyle(fontFamily: UiConstants.uiController.getFont),
    )));
  }

  @override
  void initState() {
    super.initState();
    //  TODO: getdata (user info, all products)
    // await _userController.getUserByEmail(_emailController.text);
    if (_mongoDbController.getFetchData) {
      _fetchData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: CustomizedAppBarBuilder.buildCustomizedAppBar(context),
        body: Obx(
          () => SafeArea(
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      _mongoDbController.getIsFetchingData
                          ? Container()
                          : ScrollLoopAutoScroll(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  Stack(
                                    children: [
                                      Container(
                                        alignment: Alignment.center,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.18,
                                        width: 220,
                                        decoration: BoxDecoration(
                                          color: Colors.grey,
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  "assets/images/ui/header1.jfif"),
                                              fit: BoxFit.fill),
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.18,
                                        width: 220,
                                        decoration: BoxDecoration(
                                          color: Colors.black.withOpacity(0.3),
                                          borderRadius:
                                              BorderRadius.circular(30),
                                        ),
                                        child: Text(
                                          "Enjoy\nour\nservices",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Stack(
                                    children: [
                                      Container(
                                        alignment: Alignment.center,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.18,
                                        width: 220,
                                        decoration: BoxDecoration(
                                          color: Colors.grey,
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  "assets/images/ui/header2.jpg"),
                                              fit: BoxFit.fill),
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.18,
                                        width: 220,
                                        decoration: BoxDecoration(
                                          color: Colors.black.withOpacity(0.3),
                                          borderRadius:
                                              BorderRadius.circular(30),
                                        ),
                                        child: Text(
                                          "try-n\nglasses\nfrom your\vhome",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Stack(
                                    children: [
                                      Container(
                                        alignment: Alignment.center,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.18,
                                        width: 220,
                                        decoration: BoxDecoration(
                                          color: Colors.grey,
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  "assets/images/ui/header3.jpg"),
                                              fit: BoxFit.fill),
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.18,
                                        width: 220,
                                        decoration: BoxDecoration(
                                          color: Colors.black.withOpacity(0.3),
                                          borderRadius:
                                              BorderRadius.circular(30),
                                        ),
                                        child: Text(
                                          "ecplore\nproducts\nfrom serveral\nbrands",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            itemCount: _productController
                                .getProductsList()
                                .length, //productsList.length
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 20,
                              childAspectRatio:
                                  (MediaQuery.of(context).size.width * 0.4) /
                                      (MediaQuery.of(context).size.height *
                                          0.3),
                            ),
                            //pass products info to ProductPlaceHolder
                            itemBuilder: (c, i) => ProductHolder(
                                  product:
                                      _productController.getProductsList()[i],
                                )),
                      ),
                    ],
                  ),
                ),
                _mongoDbController.getIsFetchingData
                    ? Container(
                        alignment: Alignment.center,
                        height: double.infinity,
                        width: double.infinity,
                        color: Colors.black.withOpacity(0.5),
                        child: CircularProgressIndicator())
                    : Container(),
              ],
            ),
          ),
        ),
        bottomNavigationBar: CustomizedBottomNavigationBar());
  }
}
