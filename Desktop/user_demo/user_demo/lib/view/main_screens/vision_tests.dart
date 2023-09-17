import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_demo/utils/ui_constants.dart';
import 'package:user_demo/controller/ui_controller.dart';
import 'package:user_demo/view/components/customized_rounded_button.dart';

class VisionTestsScreen extends StatelessWidget {
  VisionTestsScreen({super.key});

  final UiController uiController = UiController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: UiConstants.sndColor,
        elevation: 1,
        automaticallyImplyLeading: false,
        title: Text(
          "Vision Tests".tr,
          style: TextStyle(
            color: Colors.black,
            fontFamily: uiController.getFont,
          ),
        ),
      ),
      body: Column(children: [
        Expanded(
          child: ListView.builder(
              itemCount: 5,
              itemBuilder: (c, i) => Container(
                    height: MediaQuery.of(context).size.height * 0.15,
                    decoration:
                        BoxDecoration(color: UiConstants.sndColor, boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 1,
                      )
                    ]),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Icon(Icons.abc),
                          Text("test name"),
                          SizedBox(
                            width: 50,
                          ),
                          CustomizedRoundedButton(
                              child: Text(
                                "start test".tr,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: uiController.getFont,
                                ),
                              ),
                              color: UiConstants.mainColor,
                              width: MediaQuery.of(context).size.width * 0.3,
                              onTap: () {})
                        ]),
                  )),
        )
      ]),
    );
  }
}
