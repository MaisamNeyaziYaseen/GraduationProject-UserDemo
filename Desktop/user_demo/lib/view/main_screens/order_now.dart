import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mongo_dart/mongo_dart.dart' as mongo;
import 'package:user_demo/controller/order_controller.dart';
import 'package:user_demo/controller/user_controller.dart';
import 'package:user_demo/utils/ui_constants.dart';

class OrderNow extends StatefulWidget {
  const OrderNow({super.key});

  @override
  State<OrderNow> createState() => _OrderNowState();
}

class _OrderNowState extends State<OrderNow> {
  TextEditingController _countryController = TextEditingController();
  TextEditingController _regionController = TextEditingController();
  TextEditingController _countyController = TextEditingController();
  TextEditingController _streetController = TextEditingController();
  TextEditingController _buildingController = TextEditingController();
  TextEditingController _apartmentController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey();
  UserController _userController = Get.find(tag: "user_controller");
  OrderController _orderController = Get.find(tag: "order_controller");
  _buildWidgets() {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: Column(
            children: [
              Text(
                "Enter your location information please",
                style: TextStyle(fontSize: 18),
              ),
              Divider(),
              SizedBox(
                height: 20,
              ),
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          // padding: EdgeInsets.symmetric(horizontal: 10),
                          child: TextFormField(
                            enableSuggestions: false,
                            autocorrect: false,
                            controller: _countryController,
                            // style: TextStyle(fontFamily: uiController.getFont),
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 10),
                              enabledBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: UiConstants.mainColor)),
                              errorBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.red)),
                              labelText: "Country",
                              labelStyle: TextStyle(color: Colors.grey),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "required field";
                              }
                            },
                          )),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          // padding: EdgeInsets.symmetric(horizontal: 10),
                          child: TextFormField(
                            enableSuggestions: false,
                            autocorrect: false,
                            controller: _regionController,
                            // style: TextStyle(fontFamily: uiController.getFont),
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 10),
                              enabledBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: UiConstants.mainColor)),
                              errorBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.red)),
                              labelText: "Region",
                              labelStyle: TextStyle(color: Colors.grey),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "required field";
                              }
                            },
                          )),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          // padding: EdgeInsets.symmetric(horizontal: 10),
                          child: TextFormField(
                            enableSuggestions: false,
                            autocorrect: false,
                            controller: _countyController,
                            // style: TextStyle(fontFamily: uiController.getFont),
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 10),
                              enabledBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: UiConstants.mainColor)),
                              errorBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.red)),
                              labelText: "County",
                              labelStyle: TextStyle(color: Colors.grey),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "required field";
                              }
                            },
                          )),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          // padding: EdgeInsets.symmetric(horizontal: 10),
                          child: TextFormField(
                            enableSuggestions: false,
                            autocorrect: false,
                            controller: _streetController,
                            // style: TextStyle(fontFamily: uiController.getFont),
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 10),
                              enabledBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: UiConstants.mainColor)),
                              errorBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.red)),
                              labelText: "Street",
                              labelStyle: TextStyle(color: Colors.grey),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "required field";
                              }
                            },
                          )),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          // padding: EdgeInsets.symmetric(horizontal: 10),
                          child: TextFormField(
                            enableSuggestions: false,
                            autocorrect: false,
                            controller: _buildingController,
                            // style: TextStyle(fontFamily: uiController.getFont),
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 10),
                              enabledBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: UiConstants.mainColor)),
                              errorBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.red)),
                              labelText: "Building",
                              labelStyle: TextStyle(color: Colors.grey),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "required field";
                              }
                            },
                          )),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          // padding: EdgeInsets.symmetric(horizontal: 10),
                          child: TextFormField(
                            enableSuggestions: false,
                            autocorrect: false,
                            controller: _apartmentController,
                            keyboardType: TextInputType.number,
                            // style: TextStyle(fontFamily: uiController.getFont),
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 10),
                              enabledBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: UiConstants.mainColor)),
                              errorBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.red)),
                              labelText: "Apartment",
                              labelStyle: TextStyle(color: Colors.grey),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "required field";
                              }
                            },
                          )),
                    ],
                  )),
              SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: UiConstants.sndColor,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Details:",
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text("${_userController.getUser.cartList!.length} items"),
                    SizedBox(
                      height: 10,
                    ),
                    Text("Checkout will be on delivery"),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "The total cost is : ${_orderController.getTotal.toStringAsFixed(2)}JD",
                      style:
                          TextStyle(fontSize: 16, color: UiConstants.mainColor),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: StadiumBorder(),
                          elevation: 0,
                          backgroundColor: UiConstants.mainColor),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          mongo.ObjectId id = mongo.ObjectId();
                          _orderController.addToOrdersList(
                              id,
                              DateTime.now(),
                              "Not Payed",
                              "In-Process",
                              _userController.getUser,
                              _countryController.text,
                              _regionController.text,
                              _countyController.text,
                              _streetController.text,
                              _buildingController.text,
                              _apartmentController.text);
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("your order is confirmed")));
                        }
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width * 0.5,
                        height: MediaQuery.of(context).size.height * 0.06,
                        child: Text(
                          "Confirm Order",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16 * UiConstants.textScaleFactor,
                              fontFamily: UiConstants.uiController.getFont),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
