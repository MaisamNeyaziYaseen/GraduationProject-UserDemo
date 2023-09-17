import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_demo/utils/ui_constants.dart';
import 'package:user_demo/controller/ui_controller.dart';
import 'package:user_demo/view/components/customized_rounded_button.dart';
import 'package:user_demo/view/main_screens/optometrists.dart';
import 'package:user_demo/view/main_screens/vision_tests.dart';

class ServiceHolder extends StatelessWidget {
  final String title;
  final String subTitle;
  final String imgUrl;

  const ServiceHolder(
      {super.key,
      required this.title,
      required this.subTitle,
      required this.imgUrl});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            height: MediaQuery.of(context).size.height * 0.4,
            decoration: const BoxDecoration(
              color: Colors.grey,
            ),
            child: Image(
              image: AssetImage(imgUrl),
              fit: BoxFit.fill,
            )),
        Container(
          height: MediaQuery.of(context).size.height * 0.4,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withOpacity(0.5),
                  Colors.black.withOpacity(0.7),
                  Colors.black.withOpacity(0.7),
                  Colors.black.withOpacity(0.7),
                  Colors.black.withOpacity(0.7),
                ]),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title.tr,
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: UiConstants.uiController.getFont,
                    fontSize: 30),
                textAlign: TextAlign.center,
              ),
              Text(
                subTitle.tr,
                style: TextStyle(
                  color: Colors.grey,
                  fontFamily: UiConstants.uiController.getFont,
                  fontSize: 18,
                ),
                textAlign: TextAlign.center,
              ),
              CustomizedRoundedButton(
                color: UiConstants.mainColor,
                width: MediaQuery.of(context).size.width * 0.8,
                isElevation: true,
                boxShadow: BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  offset: const Offset(0, 8),
                  blurRadius: 8,
                  spreadRadius: 3,
                ),
                onTap: () {
                  switch (title) {
                    case "Vision Tests":
                      Get.to(() => VisionTestsScreen());
                      break;
                    case "Optometrists":
                      Get.to(() => OptometristsScreen());
                      break;
                    default:
                  }
                },
                child: Text(
                  "go".tr,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16 * UiConstants.textScaleFactor,
                      fontFamily: UiConstants.uiController.getFont),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
