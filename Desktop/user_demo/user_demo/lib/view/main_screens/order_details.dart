import 'package:flutter/material.dart';
import 'package:user_demo/model/order.dart';
import 'package:user_demo/utils/ui_constants.dart';

class OrderDetails extends StatefulWidget {
  Order order;
  OrderDetails({super.key, required this.order});

  @override
  State<OrderDetails> createState() => _OrderDetailsState(order: order);
}

class _OrderDetailsState extends State<OrderDetails> {
  Order order;

  _OrderDetailsState({required this.order});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.only(top: 20, left: 10, right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: UiConstants.sndColor,
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                children: [
                  ListTile(
                    title: Text("Order ID:"),
                    subtitle: Text("${order.id!.toJson()}"),
                  ),
                  ListTile(
                    title: Text("Number of Items:"),
                    subtitle: Text("${order.items!.length}"),
                  ),
                  ListTile(
                    title: Text("Total Cost:"),
                    subtitle: Text("${order.totalCost!.toStringAsFixed(2)}"),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Items:",
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: order.items!.length,
                  itemBuilder: (c, i) => Container(
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(
                          color: UiConstants.sndColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            Container(
                              height: 150,
                              width: 150,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: AssetImage(
                                          "${order.items![i]['item']['img_urls'][0]}"))),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            //here
                            order.items![i]['item']['on_sale']
                                ? SizedBox(
                                    width: 120,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        order.items![i]['type'] == "Glasses"
                                            ? Text(
                                                "${order.items![i]['lenses_type']}/${order.items![i]['lenses_subtype']}: ${order.items![i]['lenses_price']}JD",
                                                style: TextStyle(
                                                    color: Colors.grey),
                                              )
                                            : Container(),
                                        Text(
                                          "${order.items![i]['item']['price']}JD",
                                          style: TextStyle(
                                              color: Colors.grey,
                                              decoration:
                                                  TextDecoration.lineThrough),
                                        ),
                                        Text(
                                          "${(order.items![i]['item']['price'] * order.items![i]['item']['sale_factor']).toStringAsFixed(2)}JD",
                                          style: TextStyle(
                                            color: Colors.red,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                : SizedBox(
                                    width: 120,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        order.items![i]['type'] == "Glasses"
                                            ? Text(
                                                "${order.items![i]['lenses_type']}/${order.items![i]['lenses_subtype']}: ${order.items![i]['lenses_price']}JD",
                                                style: TextStyle(
                                                    color: Colors.grey),
                                              )
                                            : Container(),
                                        Text(
                                          "${(order.items![i]['item']['price'])}JD",
                                        ),
                                      ],
                                    ),
                                  ),

                            SizedBox(
                              width: 20,
                            ),
                            order.items![i]['quantity'] == 1
                                ? Text("${order.items![i]['quantity']} piece")
                                : Text("${order.items![i]['quantity']} pieces"),
                          ],
                        ),
                      )),
            ),
          ],
        ),
      )),
    );
  }
}
