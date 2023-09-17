import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_demo/controller/ui_controller.dart';
import 'package:user_demo/view/main_screens/appointments.dart';
import 'package:user_demo/view/main_screens/diagnoses.dart';
import 'package:user_demo/view/main_screens/orders.dart';

import '../../utils/ui_constants.dart';

class AccountSection {
  static Widget buildAccountSection(String section, List<String> titles) {
    return Container(
      height: MediaQueryData.fromWindow(WidgetsBinding.instance.window)
              .size
              .height *
          0.2,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: UiConstants.sndColor,
        border: const Border(bottom: BorderSide(width: 0.3)),
      ),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              section.tr,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: UiConstants.uiController.getFont),
            ),
            Row(
              children: [
                for (var v in titles)
                  Row(
                    children: [
                      InkWell(
                          onTap: () {
                            switch (v) {
                              case "In-Process":
                                Get.to(() => OrdersScreen(state: v));
                                break;
                              case "Delivered":
                                Get.to(() => OrdersScreen(state: v));
                                break;
                              case "diagnoses":
                                Get.to(() => DiagnosesScreen());
                                break;
                              case "appointments":
                                Get.to(() => AppointmentsScreen());
                                break;
                              default:
                            }
                          },
                          child: Text(
                            v.tr,
                            style: TextStyle(
                                fontSize: 16 * UiConstants.textScaleFactor,
                                fontFamily: UiConstants.uiController.getFont),
                          )),
                      const SizedBox(
                        width: 50,
                      ),
                    ],
                  )
              ],
            ),
          ]),
    );
  }
}
