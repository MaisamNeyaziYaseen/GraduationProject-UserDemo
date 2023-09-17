import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_demo/controller/ui_controller.dart';

class UiConstants {
  static Color mainColor = Color(0xff5D3891);
  static Color orange = Color(0xffFC9C1B);
  static Color sndColor = Color(0xFFF4F4F4);
  static UiController uiController =
      Get.find<UiController>(tag: "ui_controller");
  static var textScaleFactor =
      MediaQueryData.fromWindow(WidgetsBinding.instance.window).textScaleFactor;
  static List<String> productDetailsLables = [
    "Brand",
    "Type",
    "UV Protection",
    "Gender",
    "Age",
    "Frame Color",
    "Lens Color",
    "Frame Shape",
    "Frame Type",
    "Frame Material",
    "Frame Finish",
    "Lens Finish",
    "Frame Width",
    "Lens Width",
    "Lens Height",
    "Nose Bridge",
    "Temple Length"
  ];

  static List<double> initializeSphere() {
    List<double> sphere = [];
    for (double i = -15.0; i <= 15; i += 0.25) {
      sphere.add(i);
    }

    return sphere;
  }

  static List<double> initializeCylinder() {
    List<double> cylinder = [];

    for (double i = -5.0; i <= 5.0; i += 0.25) {
      cylinder.add(i);
    }

    return cylinder;
  }

  static List<int> initializeAxis() {
    List<int> axis = [];
    for (int i = 30; i <= 80; i++) {
      axis.add(i);
    }
    return axis;
  }

  static List<int> initializePD() {
    List<int> pd = [];
    for (int i = 30; i <= 80; i++) {
      pd.add(i);
    }
    return pd;
  }

  static List<double> initializeMagnificationStrength() {
    List<double> ms = [];

    for (double i = 0.75; i <= 3.0; i += 0.25) {
      ms.add(i);
    }

    return ms;
  }

  static List<double> sphere = initializeSphere();

  static List<double> cylinder = initializeCylinder();

  static List<int> axis = initializeAxis();

  static List<int> pd = initializePD();

  static List<double> magnificationstrength = initializeMagnificationStrength();
}
