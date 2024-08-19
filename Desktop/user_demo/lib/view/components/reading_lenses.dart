import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_demo/controller/ui_controller.dart';
import 'package:user_demo/controller/user_controller.dart';
import 'package:user_demo/model/product.dart';
import 'package:user_demo/utils/ui_constants.dart';

class BuildReadingLensesDialog extends StatefulWidget {
  Product product;
  BuildReadingLensesDialog({super.key, required this.product});

  @override
  State<BuildReadingLensesDialog> createState() =>
      _BuildReadingLensesDialogState(product: product);
}

class _BuildReadingLensesDialogState extends State<BuildReadingLensesDialog> {
  bool _coatingSelected = false;
  double _lensesPrice = 0.0;
  String _lensesSubtype = "";
  Product product;
  String? magnificationStrength;

  UserController _userController = Get.find(tag: "user_controller");
  UiController _uiController = Get.find(tag: "ui_controller");

  _BuildReadingLensesDialogState({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: !_coatingSelected
            ? SingleChildScrollView(
                child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                    child: Column(
                      children: [
                        Text("Select Coating Option"),
                        Divider(),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: UiConstants.mainColor,
                              )),
                          child: Column(
                            children: [
                              SimpleDialogOption(
                                onPressed: () {
                                  setState(() {
                                    _coatingSelected = true;
                                    _lensesSubtype = "Standard Lenses";
                                  });
                                },
                                child: ListTile(
                                  leading: Icon(Icons.adb),
                                  title: Text("Standard Lenses"),
                                  subtitle: Text(
                                      "Our lenses come standard with water repellent, anti-reflective, and scratch resistant coatings"),
                                  trailing: Text("Free"),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: UiConstants.mainColor,
                              )),
                          child: Column(
                            children: [
                              SimpleDialogOption(
                                onPressed: () {
                                  setState(() {
                                    _coatingSelected = true;
                                    _lensesPrice = 150.0;
                                    _lensesSubtype = "Blue Light Filter";
                                  });
                                },
                                child: ListTile(
                                  leading: Icon(Icons.adb),
                                  title: Text("Blue Light Filter"),
                                  subtitle: Text(
                                      "Can help reduce visual fatigue from excessive screen use"),
                                  trailing: Text("+ 150JD"),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    )),
              )
            : Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                padding: EdgeInsets.symmetric(vertical: 50, horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Select Magnification Strength"),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(3)),
                          child: DropdownButton<String>(
                            menuMaxHeight: 200,
                            hint: Text("Select"),
                            value: magnificationStrength,
                            items: [
                              for (double value
                                  in UiConstants.magnificationstrength)
                                DropdownMenuItem(
                                    value: value.toString(),
                                    child: Text("+ ${value.toString()}")),
                            ],
                            onChanged: (value) {
                              setState(() {
                                magnificationStrength = value.toString();
                              });
                            },
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: UiConstants.mainColor)),
                          child: ListTile(
                            title: Text("Total price"),
                            subtitle: Text(
                                "${product.items![_uiController.getSelectedItem].price} + $_lensesPrice = ${(product.items![_uiController.getSelectedItem].price! + _lensesPrice).toStringAsFixed(2)}JD"),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 60,
                      width: 200,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: StadiumBorder(),
                            elevation: 0,
                            backgroundColor: UiConstants.mainColor),
                        onPressed: () {
                          Map<String, dynamic> leftLens = {};
                          Map<String, dynamic> rightLens = {};

                          leftLens['ms'] = magnificationStrength;
                          rightLens['ms'] = magnificationStrength;
                          if (magnificationStrength != null) {
                            _userController.addToCartList(
                              product.id!,
                              product.supplier!.id!,
                              product.type!,
                              product.items![_uiController.getSelectedItem],
                              lensesType: "Reading Lenses",
                              lensesSubtype: _lensesSubtype,
                              lensesPrice: _lensesPrice,
                              leftLens: leftLens,
                              rightLens: rightLens,
                            );
                          }
                        },
                        child: Text(
                          "add to cart",
                          style: TextStyle(
                            fontSize: 16 * UiConstants.textScaleFactor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
