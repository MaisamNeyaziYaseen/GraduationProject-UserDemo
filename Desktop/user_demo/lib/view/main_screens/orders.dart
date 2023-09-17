import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_demo/controller/order_controller.dart';
import 'package:user_demo/controller/ui_controller.dart';
import 'package:user_demo/controller/user_controller.dart';
import 'package:user_demo/model/order.dart';
import 'package:user_demo/view/main_screens/order_details.dart';
import '../../utils/ui_constants.dart';

class OrdersScreen extends StatefulWidget {
  String state;
  OrdersScreen({super.key, required this.state});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState(state: state);
}

class _OrdersScreenState extends State<OrdersScreen> {
  final UiController uiController = UiController();
  final String state;
  UserController _userController = Get.find(tag: "user_controller");
  OrderController _orderController = Get.find(tag: "order_controller");
  List<Order> orders = [];

  @override
  void initState() {
    super.initState();
    orders = _orderController.getOrdersList
        .where((e) => e.deliveryState == state)
        .toList();
  }

  _OrdersScreenState({required this.state});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: UiConstants.sndColor,
        elevation: 1,
        automaticallyImplyLeading: false,
        title: Text(
          "$state orders",
          style: TextStyle(
            color: Colors.black,
            fontFamily: uiController.getFont,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 20),
        child: ListView.builder(
            itemCount: orders.length,
            itemBuilder: (c, i) => Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: UiConstants.sndColor,
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                "Ordered in: ${orders[i].date!.day}-${orders[i].date!.month}-${orders[i].date!.year}"),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                                "Total Cost: ${orders[i].totalCost!.toStringAsFixed(2)}"),
                            SizedBox(
                              height: 10,
                            ),
                            InkWell(
                                onTap: () {
                                  Get.to(() => OrderDetails(
                                        order: orders[i],
                                      ));
                                },
                                child: Text(
                                  "Show Details",
                                  style:
                                      TextStyle(color: UiConstants.mainColor),
                                )),
                          ]),
                    ),
                    SizedBox(
                      height: 10,
                    )
                  ],
                )),
      ),
    );
  }
}
