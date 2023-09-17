import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_demo/controller/ui_controller.dart';
import 'package:user_demo/controller/user_controller.dart';
import 'package:user_demo/model/product.dart';
import 'package:user_demo/utils/ui_constants.dart';

class BuildNonPrescriptionDialog extends StatefulWidget {
  Product product;
  BuildNonPrescriptionDialog({super.key, required this.product});

  @override
  State<BuildNonPrescriptionDialog> createState() =>
      _BuildNonPrescriptionDialogState(product: product);
}

class _BuildNonPrescriptionDialogState
    extends State<BuildNonPrescriptionDialog> {
  bool _isStandard = false;
  bool _isBlueLight = false;
  double _lensesPrice = 0.0;
  String? _lensesSubtype = "";

  UserController _userController = Get.find(tag: "user_controller");
  UiController _uiController = Get.find(tag: "ui_controller");

  Product product;
  _BuildNonPrescriptionDialogState({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: Column(
              children: [
                Text("Select Coating Option"),
                Divider(),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      _lensesSubtype = "Standard Lenses";
                      if (_isBlueLight) {
                        _isBlueLight = false;
                      }
                      _isStandard = !_isStandard;
                      if (_isStandard) {
                        _lensesPrice = 0.0;
                      }
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                    decoration: BoxDecoration(
                        color: _isStandard
                            ? Colors.black.withOpacity(0.1)
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: UiConstants.mainColor,
                        )),
                    child: ListTile(
                      leading: Icon(Icons.adb),
                      title: Text("Standard Lenses"),
                      subtitle: Text(
                          "Our lenses come standard with water repellent, anti-reflective, and scratch resistant coatings"),
                      trailing: Text("Free"),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      _lensesSubtype = "Blue Light Filter";
                      if (_isStandard) {
                        _isStandard = false;
                      }
                      _isBlueLight = !_isBlueLight;
                      if (_isBlueLight) {
                        _lensesPrice = 150.0;
                      }
                    });
                  },
                  autofocus: true,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: _isBlueLight
                            ? Colors.black.withOpacity(0.1)
                            : Colors.transparent,
                        border: Border.all(
                          color: UiConstants.mainColor,
                        )),
                    child: ListTile(
                      leading: Icon(Icons.adb),
                      title: Text("Blue Light Filter"),
                      subtitle: Text(
                          "Can help reduce visual fatigue from excessive screen use"),
                      trailing: Text("+ 150JD"),
                    ),
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
                        "${product.items![_uiController.getSelectedItem].price} + ${_lensesPrice} = ${product.items![_uiController.getSelectedItem].price! + _lensesPrice}"),
                  ),
                ),
                SizedBox(
                  height: 20,
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
                      if (!_isBlueLight && !_isStandard) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Select coating option")));
                      } else {
                        _userController.addToCartList(
                            product.id!,
                            product.supplier!.id!,
                            product.type!,
                            product.items![_uiController.getSelectedItem],
                            lensesPrice: _lensesPrice,
                            lensesType: "Non-Prescription",
                            lensesSubtype: _lensesSubtype);
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Product Added to cart")));
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
            )),
      ),
    );
  }
}
