import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_demo/controller/ui_controller.dart';
import 'package:user_demo/view/components/customized_rounded_button.dart';

import '../../utils/ui_constants.dart';

class OptometristsScreen extends StatelessWidget {
  OptometristsScreen({super.key});

  final UiController uiController = UiController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: UiConstants.sndColor,
        elevation: 1,
        automaticallyImplyLeading: false,
        title: Text(
          "Optometrists".tr,
          style: TextStyle(
            color: Colors.black,
            fontFamily: uiController.getFont,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: 10,
                itemBuilder: (c, i) => Container(
                      alignment: uiController.getLocale == Locale("en")
                          ? Alignment.centerLeft
                          : Alignment.centerRight,
                      height: MediaQuery.of(context).size.height * 0.2,
                      padding: EdgeInsets.only(
                          left: uiController.getLocale == Locale("en") ? 20 : 0,
                          right:
                              uiController.getLocale == Locale("en") ? 0 : 20),
                      decoration: BoxDecoration(
                          color: UiConstants.sndColor,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              spreadRadius: 1,
                              blurRadius: 1,
                            )
                          ]),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "optics center name",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontFamily: uiController.getFont),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.pin_drop_outlined,
                                    color: Colors.grey,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "location",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "500m away",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          CustomizedRoundedButton(
                              child: Text(
                                "details".tr,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: uiController.getFont),
                              ),
                              color: UiConstants.mainColor,
                              width: MediaQuery.of(context).size.width * 0.3,
                              onTap: () {})
                        ],
                      ),
                    )),
          )
        ],
      ),
    );
  }
}
