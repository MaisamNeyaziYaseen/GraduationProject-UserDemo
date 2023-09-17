import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_demo/controller/user_controller.dart';
import 'package:user_demo/model/item.dart';
import 'package:user_demo/model/product.dart';
import 'package:user_demo/utils/ui_constants.dart';
import 'package:user_demo/view/components/customized_app_bar.dart';
import 'package:user_demo/view/components/non_prescription.dart';
import 'package:user_demo/view/components/prescription_widget.dart';
import 'package:user_demo/view/components/reading_lenses.dart';
import 'package:user_demo/view/main_screens/virtual_try_on/ar_view.dart';
import '../../../controller/ui_controller.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductDetailsScreen extends StatefulWidget {
  Product product;

  ProductDetailsScreen({super.key, required this.product});

  @override
  State<ProductDetailsScreen> createState() =>
      _ProductDetailsScreenState(product: product);
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  _ProductDetailsScreenState({required this.product});
  final UiController _uiController = Get.find(tag: "ui_controller");
  Product product;
  PageController _imgController = PageController();
  UserController _userController = Get.find(tag: "user_controller");

  dynamic _getDetailsValue(String lable, int index) {
    switch (lable) {
      case "Brand":
        return product.supplier!.name;
      case "Type":
        return product.type!;
      case "UV Protection":
        return product.items![index].details!.uvProtection ?? "";
      case "Gender":
        return product.gender!;
      case "Age":
        return product.age!;
      case "Frame Color":
        return product.items![index].details!.frameColor!;
      case "Lens Color":
        return product.items![index].details!.lensColor!;
      case "Frame Shape":
        return product.items![index].details!.frameShape!;
      case "Frame Type":
        return product.items![index].details!.frameType!;
      case "Frame Material":
        return product.items![index].details!.frameMaterial!;
      case "Frame Finish":
        return product.items![index].details!.frameFinidh!;
      case "Lens Finish":
        return product.items![index].details!.lensFinish!;
      case "Frame Width":
        return product.items![index].details!.frameWidth!;
      case "Lens Width":
        return product.items![index].details!.lensWidth!;
      case "Lens Height":
        return product.items![index].details!.lensHeight!;
      case "Nose Bridge":
        return product.items![index].details!.noseBridge!;
      case "Temple Length":
        return product.items![index].details!.templeLength!;
    }
  }

  _goToDialogOption(String content, Item item) {
    switch (content) {
      case "Prescription":
        Get.to(() => BuildPrescriptionDialog(
              product: product,
            ));
        break;
      case "Reading Lenses":
        Get.to(() => BuildReadingLensesDialog(
              product: product,
            ));
        break;
      case "Non-Prescription":
        Get.to(() => BuildNonPrescriptionDialog(
              product: product,
            ));
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    _uiController.setSelectedItem(0);
    return Scaffold(
      appBar: CustomizedAppBarBuilder.buildCustomizedAppBar(context),
      body: Obx(
        () => DefaultTabController(
          length: 2,
          child: Column(children: [
            Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: PageView(
                    controller: _imgController,
                    children: [
                      for (int i = 0;
                          i <
                              product.items![_uiController.getSelectedItem]
                                  .imgUrls!.length;
                          i++)
                        Container(
                          alignment: Alignment.center,
                          height: MediaQuery.of(context).size.height * 0.3,
                          decoration: BoxDecoration(
                              // color: Colors.white,
                              image: DecorationImage(
                            image: AssetImage(product
                                .items![_uiController.getSelectedItem]
                                .imgUrls![i]),
                          )),
                        ),
                    ],
                  ),
                ),
                product.items![_uiController.getSelectedItem].isTryOn!
                    ? Positioned(
                        top: (MediaQuery.of(context).size.height * 0.3) -
                            (MediaQuery.of(context).size.height * 0.05) -
                            10,
                        left: (MediaQuery.of(context).size.width) -
                            (MediaQuery.of(context).size.width * 0.25) -
                            10,
                        child: InkWell(
                          onTap: () {
                            //open camera
                            //face detection and frame positioning

                            // Get.to(() => CameraScreen());
                            Get.to(() => ArView(
                                item: product
                                    .items![_uiController.getSelectedItem]));
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: MediaQuery.of(context).size.height * 0.05,
                            width: MediaQuery.of(context).size.width * 0.25,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(
                                    MediaQuery.of(context).size.height *
                                        0.05 *
                                        MediaQuery.of(context).size.width *
                                        0.25 *
                                        0.007)),
                                color: UiConstants.orange,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.white.withOpacity(0.5),
                                    offset: Offset(0, 3),
                                    blurRadius: 5,
                                    spreadRadius: 3,
                                  )
                                ]),
                            child: Text(
                              "try it now".tr,
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      )
                    : Container(),
              ],
            ),
            Container(
              padding: EdgeInsets.only(top: 8),
              decoration: BoxDecoration(
                color: UiConstants.sndColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50)),
              ),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: SmoothPageIndicator(
                      controller: _imgController,
                      count: product.items![_uiController.getSelectedItem]
                          .imgUrls!.length,
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.08,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                        border: Border(bottom: BorderSide(width: 0.5))),
                    child: Text(
                      product.title!,
                      style: TextStyle(
                          color: Colors.grey,
                          fontFamily: _uiController.getFont),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.08,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                        border: Border(bottom: BorderSide(width: 0.5))),
                    child: product.items![_uiController.getSelectedItem].onSale!
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "sale %${(product.items![_uiController.getSelectedItem].saleFactor! * 100).toInt()}",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontFamily: _uiController.getFont),
                              ),
                              Row(
                                children: [
                                  Text(
                                    "${product.items![_uiController.getSelectedItem].price}JD",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 18,
                                      fontFamily: _uiController.getFont,
                                      decoration: TextDecoration.lineThrough,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "${(product.items![_uiController.getSelectedItem].price! - product.items![_uiController.getSelectedItem].price! * product.items![_uiController.getSelectedItem].saleFactor!).toStringAsFixed(2)}JD",
                                    style: TextStyle(
                                        color: Colors.red,
                                        fontSize: 18,
                                        fontFamily: _uiController.getFont),
                                  ),
                                ],
                              ),
                            ],
                          )
                        : Text(
                            "${product.items![_uiController.getSelectedItem].price}JD",
                            style: TextStyle(
                                fontSize: 18,
                                fontFamily: _uiController.getFont),
                          ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.1,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                        border: Border(bottom: BorderSide(width: 0.5))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              "colors: ",
                              style:
                                  TextStyle(fontFamily: _uiController.getFont),
                            ),
                            Text(
                              "${product.items![_uiController.getSelectedItem].details!.frameColor}/${product.items![_uiController.getSelectedItem].details!.lensColor}",
                              style: TextStyle(
                                  fontFamily: _uiController.getFont,
                                  color: Colors.grey),
                            ),
                          ],
                        ),
                        Container(
                          height: 30,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: product.items!.length,
                              itemBuilder: (c, i) {
                                return InkWell(
                                  splashColor: Colors.white,
                                  onTap: () {
                                    _uiController.setSelectedItem(i);
                                  },
                                  child: Container(
                                    width: 30,
                                    height: 30,
                                    alignment: Alignment.center,
                                    padding: EdgeInsets.all(4),
                                    margin: EdgeInsets.only(right: 5),
                                    decoration: BoxDecoration(
                                      color: Color(int.parse(
                                          "0xff${product.items![i].details!.frameColorCode}")),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Color(int.parse(
                                              "0xff${product.items![i].details!.lensColorCode}")),
                                          shape: BoxShape.circle),
                                    ),
                                  ),
                                );
                              }),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            TabBar(
              unselectedLabelColor: Colors.grey,
              labelColor: Colors.black,
              tabs: [
                Tab(
                  child: Text(
                    "description".tr,
                    style: TextStyle(fontFamily: _uiController.getFont),
                  ),
                ),
                Tab(
                  child: Text(
                    "details".tr,
                    style: TextStyle(fontFamily: _uiController.getFont),
                  ),
                ),
              ],
            ),
            Expanded(
              child: TabBarView(children: [
                ListView(
                  children: [
                    Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: Text(
                          product.description!,
                          style: TextStyle(
                              fontSize: 16, fontFamily: _uiController.getFont),
                        )),
                  ],
                ),
                ListView.builder(
                  itemCount: UiConstants.productDetailsLables.length,
                  itemBuilder: (c, i) => Container(
                    height: MediaQuery.of(context).size.height * 0.08,
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    decoration: BoxDecoration(
                      // color: UiConstants.sndColor,
                      border: Border(bottom: BorderSide(width: 0.5)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          UiConstants.productDetailsLables[i],
                          style: TextStyle(color: Colors.grey),
                        ),
                        _getDetailsValue(UiConstants.productDetailsLables[i],
                                _uiController.getSelectedItem) is List
                            ? Text(
                                "${_getDetailsValue(UiConstants.productDetailsLables[i], _uiController.getSelectedItem).join(", ")}",
                                style: TextStyle(color: Colors.grey))
                            : Text(
                                "${_getDetailsValue(UiConstants.productDetailsLables[i], _uiController.getSelectedItem)}",
                                style: TextStyle(color: Colors.grey),
                              )
                      ],
                    ),
                  ),
                ),
              ]),
            ),
          ]),
        ),
      ),
      bottomNavigationBar: Container(
        width: MediaQuery.of(context).size.width * 0.7,
        height: MediaQuery.of(context).size.height * 0.08,
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: StadiumBorder(),
              elevation: 0,
              backgroundColor: UiConstants.mainColor),
          onPressed: () {
            if (product.type == "Sunglasses") {
              _userController.addToCartList(product.id!, product.supplier!.id!,
                  product.type!, product.items![_uiController.getSelectedItem]);
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Product added to cart")));
            } else if (product.type == "Glasses") {
              //show dialog box
              showDialog(
                  context: context,
                  builder: (_) => SimpleDialog(
                        children: [
                          Container(
                            child: Column(
                              children: [
                                Text(
                                  "Select lenses type",
                                  style: TextStyle(fontSize: 18),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                SimpleDialogOption(
                                  onPressed: () {
                                    _goToDialogOption(
                                        "Prescription",
                                        product.items![
                                            _uiController.getSelectedItem]);
                                  },
                                  child: ListTile(
                                    leading: Icon(Icons.report),
                                    title: Text("Prescription"),
                                    subtitle: Text(
                                        "Single-vision lenses for distance or near vision"),
                                  ),
                                ),
                                SimpleDialogOption(
                                  onPressed: () {
                                    _goToDialogOption(
                                        "Reading Lenses",
                                        product.items![
                                            _uiController.getSelectedItem]);
                                  },
                                  child: ListTile(
                                    leading: Icon(Icons.report),
                                    title: Text("Reading Lenses"),
                                    subtitle:
                                        Text("Magnifying Reading Glasses"),
                                  ),
                                ),
                                SimpleDialogOption(
                                  onPressed: () {
                                    _goToDialogOption(
                                        "Non-Prescription",
                                        product.items![
                                            _uiController.getSelectedItem]);
                                  },
                                  child: ListTile(
                                    leading: Icon(Icons.report),
                                    title: Text("Non-Prescription"),
                                    subtitle: Text(
                                        "Clear, hard-coated lenses ready to wear"),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ));
            }
          },
          child: Text(
            "add to cart".tr,
            style: TextStyle(
              fontSize: 16 * UiConstants.textScaleFactor,
              fontFamily: _uiController.getFont,
            ),
          ),
        ),
      ),
    );
  }
}
