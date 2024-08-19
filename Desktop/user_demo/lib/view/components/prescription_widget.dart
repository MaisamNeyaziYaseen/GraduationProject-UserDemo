import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_demo/controller/ui_controller.dart';
import 'package:user_demo/controller/user_controller.dart';
import 'package:user_demo/model/product.dart';
import 'package:user_demo/utils/ui_constants.dart';

class BuildPrescriptionDialog extends StatefulWidget {
  Product product;

  BuildPrescriptionDialog({super.key, required this.product});

  @override
  State<BuildPrescriptionDialog> createState() =>
      _BuildPrescriptionDialogState(product: product);
}

class _BuildPrescriptionDialogState extends State<BuildPrescriptionDialog> {
  bool _packageSelected = false;
  double _price = 0.0;
  String _lensesSubType = "";

  double? osSphere;
  double? osCylinder;
  int? osAxis;

  double? odSphere;
  double? odCylinder;
  int? odAxis;

  int? leftPD;
  int? rightPD;

  Product product;

  UserController _userController = Get.find(tag: "user_controller");
  UiController _uiController = Get.find(tag: "ui_controller");

  _BuildPrescriptionDialogState({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: !_packageSelected
            ? SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  child: Column(
                    children: [
                      Text("Select Package Option"),
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
                                  _packageSelected = true;
                                  _lensesSubType = "Standard";
                                });
                              },
                              child: ListTile(
                                leading: Icon(Icons.adb),
                                title: Text("Standard"),
                                subtitle: Text(
                                    "Durable, transparent lenses that eliminate reflections, resist scratches, and protect your eyes from UV rays."),
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
                                  _packageSelected = true;
                                  _price = 100.0;
                                  _lensesSubType = "Premier";
                                });
                              },
                              child: ListTile(
                                leading: Icon(Icons.adb),
                                title: Text("Premier"),
                                subtitle: Text(
                                    "Enhanced lenses are designed to eliminate reflections, protect the eyes from harmful UV rays, resist scratches, and reduce fogging in hot and humid conditions."),
                                trailing: Text("+ 100JD"),
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
                                  _packageSelected = true;
                                  _price = 200;
                                  _lensesSubType = "Elite";
                                });
                              },
                              child: ListTile(
                                leading: Icon(Icons.adb),
                                title: Text("Elite"),
                                subtitle: Text(
                                    "Premium German lenses are designed to eliminate reflections, protect against harmful UV rays, reduce fogging, resist scratches, repel dust, and prevent smudges, resulting in lenses that stay clean and clear for longer periods of time."),
                                trailing: Text("+ 200JD"),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            : SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  child: Column(
                    children: [
                      Text("Enter your perscription information"),
                      Divider(),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: UiConstants.sndColor,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Left Eye - OS"),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  children: [
                                    Text("Sphere"),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.grey),
                                          borderRadius:
                                              BorderRadius.circular(3)),
                                      child: DropdownButton<double>(
                                        menuMaxHeight: 200,
                                        hint: Text("Select"),
                                        value: osSphere,
                                        items: [
                                          for (double value
                                              in UiConstants.sphere)
                                            DropdownMenuItem(
                                                value: value,
                                                child: Text(value.toString())),
                                        ],
                                        onChanged: (value) {
                                          setState(() {
                                            osSphere = value;
                                          });
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text("Cylinder"),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.grey),
                                          borderRadius:
                                              BorderRadius.circular(3)),
                                      child: DropdownButton<double>(
                                        menuMaxHeight: 200,
                                        hint: Text("Select"),
                                        value: osCylinder,
                                        items: [
                                          for (double value
                                              in UiConstants.cylinder)
                                            DropdownMenuItem(
                                                value: value,
                                                child: Text(value.toString())),
                                        ],
                                        onChanged: (value) {
                                          setState(() {
                                            osCylinder = value;
                                          });
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                Column(children: [
                                  Text("Axis"),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.grey),
                                        borderRadius: BorderRadius.circular(3)),
                                    child: DropdownButton<int>(
                                      menuMaxHeight: 200,
                                      hint: Text("Select"),
                                      value: osAxis,
                                      items: [
                                        for (int value in UiConstants.axis)
                                          DropdownMenuItem(
                                              value: value,
                                              child: Text(value.toString())),
                                      ],
                                      onChanged: (value) {
                                        setState(() {
                                          osAxis = value;
                                        });
                                      },
                                    ),
                                  ),
                                ]),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: UiConstants.sndColor,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Right Eye - OD"),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  children: [
                                    Text("Sphere"),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.grey),
                                          borderRadius:
                                              BorderRadius.circular(3)),
                                      child: DropdownButton<double>(
                                        menuMaxHeight: 200,
                                        hint: Text("Select"),
                                        value: odSphere,
                                        items: [
                                          for (double value
                                              in UiConstants.sphere)
                                            DropdownMenuItem(
                                                value: value,
                                                child: Text(value.toString())),
                                        ],
                                        onChanged: (value) {
                                          setState(() {
                                            odSphere = value;
                                          });
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text("Cylinder"),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.grey),
                                          borderRadius:
                                              BorderRadius.circular(3)),
                                      child: DropdownButton<double>(
                                        menuMaxHeight: 200,
                                        hint: Text("Select"),
                                        value: odCylinder,
                                        items: [
                                          for (double value
                                              in UiConstants.cylinder)
                                            DropdownMenuItem(
                                                value: value,
                                                child: Text(value.toString())),
                                        ],
                                        onChanged: (value) {
                                          setState(() {
                                            odCylinder = value;
                                          });
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                Column(children: [
                                  Text("Axis"),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.grey),
                                        borderRadius: BorderRadius.circular(3)),
                                    child: DropdownButton<int>(
                                      menuMaxHeight: 200,
                                      hint: Text("Select"),
                                      value: odAxis,
                                      items: [
                                        for (int value in UiConstants.axis)
                                          DropdownMenuItem(
                                              value: value,
                                              child: Text(value.toString())),
                                      ],
                                      onChanged: (value) {
                                        setState(() {
                                          odAxis = value;
                                        });
                                      },
                                    ),
                                  ),
                                ]),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: UiConstants.sndColor,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("PD - Popularity Distance"),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  children: [
                                    Text("Left PD"),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.grey),
                                          borderRadius:
                                              BorderRadius.circular(3)),
                                      child: DropdownButton<int>(
                                        menuMaxHeight: 200,
                                        hint: Text("Select"),
                                        value: leftPD,
                                        items: [
                                          for (int value in UiConstants.pd)
                                            DropdownMenuItem(
                                                value: value,
                                                child: Text(value.toString())),
                                        ],
                                        onChanged: (value) {
                                          setState(() {
                                            leftPD = value;
                                          });
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                Column(children: [
                                  Text("Right PD"),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.grey),
                                        borderRadius: BorderRadius.circular(3)),
                                    child: DropdownButton<int>(
                                      menuMaxHeight: 200,
                                      hint: Text("Select"),
                                      value: rightPD,
                                      items: [
                                        for (int value in UiConstants.pd)
                                          DropdownMenuItem(
                                              value: value,
                                              child: Text(value.toString())),
                                      ],
                                      onChanged: (value) {
                                        setState(() {
                                          rightPD = value;
                                        });
                                      },
                                    ),
                                  ),
                                ]),
                              ],
                            ),
                          ],
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
                              "${product.items![_uiController.getSelectedItem].price} + ${_price} = ${(product.items![_uiController.getSelectedItem].price! + _price).toStringAsFixed(2)}JD"),
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
                            if (osSphere != null &&
                                osCylinder != null &&
                                osAxis != null &&
                                odSphere != null &&
                                odCylinder != null &&
                                odAxis != null &&
                                leftPD != null &&
                                rightPD != null) {
                              Map<String, dynamic> leftLens = {};
                              Map<String, dynamic> rightLens = {};
                              //left lens
                              leftLens['os_sphere'] = osSphere;
                              leftLens['os_cylinder'] = osCylinder;
                              leftLens['os_axis'] = osAxis;
                              leftLens['left_pd'] = leftPD;
                              //right lens
                              rightLens['od_sphere'] = odSphere;
                              rightLens['od_cylinder'] = odCylinder;
                              rightLens['od_axis'] = odAxis;
                              rightLens['right_pd'] = rightPD;
                              //add glasses to cart
                              _userController.addToCartList(
                                  product.id!,
                                  product.supplier!.id!,
                                  product.type!,
                                  product.items![_uiController.getSelectedItem],
                                  lensesType: "Prescription",
                                  lensesSubtype: _lensesSubType,
                                  leftLens: leftLens,
                                  rightLens: rightLens,
                                  lensesPrice: _price);
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: Text("Product added to cart")));
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                  content: Text(
                                      "Enter all you prescription information ")));
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
      ),
    );
  }
}
