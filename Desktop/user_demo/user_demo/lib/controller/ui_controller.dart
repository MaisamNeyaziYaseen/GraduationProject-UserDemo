import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UiController extends GetxController {
  Rx<Locale> locale = Get.deviceLocale.toString().startsWith("en")
      ? Locale("en").obs
      : Locale("ar").obs;
  RxString font = Get.deviceLocale.toString().startsWith("en")
      ? RxString("varela_round")
      : RxString("sst_arabic_roman");
  RxBool isObsecure = RxBool(true);
  RxInt navigationBarIndex = RxInt(4);
  RxBool isProcessSignIn = RxBool(false);
  RxBool isProcessSignUp = RxBool(false);
  RxBool isValidate = RxBool(true);
  RxInt selectedItem = RxInt(0);
  RxBool _isFetchingData = RxBool(false);
  RxBool _fetchData = RxBool(true);

  Locale get getLocale => locale.value;
  String get getFont => font.value;
  bool get getIsObsecure => isObsecure.value;
  int get getNavigationBarIndex => navigationBarIndex.value;
  bool get getIsProcessSignIn => isProcessSignIn.value;
  bool get getIsProcessSignUp => isProcessSignUp.value;
  bool get getIsValidate => isValidate.value;
  int get getSelectedItem => selectedItem.value;

  setLocale(Locale v) => locale.value = v;
  setFont(String v) => font.value = v;
  setIsObsecure(bool v) => isObsecure.value = v;
  setNavigationBarIndex(int v) => navigationBarIndex.value = v;
  setIsProcessSignIn(bool v) => isProcessSignIn.value = v;
  setIsProcessSignUp(bool v) => isProcessSignUp.value = v;
  setIsValidate(bool v) => isValidate.value = v;
  setSelectedItem(int v) => selectedItem.value = v;
}
