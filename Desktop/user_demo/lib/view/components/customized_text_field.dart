import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_demo/controller/user_controller.dart';
import 'package:user_demo/utils/ui_constants.dart';
import 'package:user_demo/controller/ui_controller.dart';

class CustomizedTextField extends StatelessWidget {
  UserController userController = Get.find(tag: "user_controller");

  final GlobalKey<FormState> formKey;
  final TextEditingController textEditingController;
  final IconData? prefixIconData;
  final IconData? suffixIconData;
  final String hintText;
  final bool isEmail;
  final bool isRequired;
  final bool isUsername;
  final bool isphone;
  bool isObsecure;
  final bool enabled;
  final TextInputType textInputType;
  final VoidCallback? onTap;
  final double widthRatio;
  final double hPadding;
  final double vPadding;
  final double hMargin;
  final double vMargin;

  CustomizedTextField(
      {super.key,
      required this.formKey,
      required this.textEditingController,
      this.prefixIconData,
      this.suffixIconData,
      required this.hintText,
      this.isEmail = false,
      this.isRequired = true,
      this.isUsername = false,
      this.isphone = false,
      this.isObsecure = false,
      this.textInputType = TextInputType.text,
      this.enabled = true,
      this.onTap,
      this.widthRatio = 1,
      this.hPadding = 0,
      this.vPadding = 0,
      this.hMargin = 0,
      this.vMargin = 5});

  @override
  Widget build(BuildContext context) {
    UiController uiController = UiController();

    return Obx(() => Container(
        width: MediaQuery.of(context).size.width * widthRatio,
        margin: EdgeInsets.symmetric(vertical: vMargin, horizontal: hMargin),
        padding: EdgeInsets.symmetric(horizontal: hPadding),
        child: TextFormField(
          enableSuggestions: false,
          autocorrect: false,
          controller: textEditingController,
          enabled: enabled,
          obscureText: isObsecure,
          keyboardType: textInputType,
          style: TextStyle(fontFamily: uiController.getFont),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.zero,
            enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey)),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: UiConstants.mainColor)),
            errorBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.red)),
            prefixIcon: Icon(
              prefixIconData,
              color: Colors.grey,
            ),
            suffixIcon: IconButton(
              icon: Icon(suffixIconData),
              color: uiController.getIsObsecure
                  ? Colors.grey
                  : UiConstants.mainColor,
              onPressed: () {
                uiController.setIsObsecure(!uiController.getIsObsecure);
                isObsecure = uiController.getIsObsecure;
              },
            ),
            labelText: hintText,
            labelStyle:
                TextStyle(color: Colors.grey, fontFamily: uiController.getFont),
          ),
          validator: (value) {
            //validation of empty input
            if (isRequired && value!.isEmpty) {
              return '$hintText is required';
            } else {
              //validation of language

              //validation of phone number format
              if (isphone) {
                //length
                if (value!.length != 10) {
                  return ("phone number must contain 10 digits");
                }
                //if phone number format is not correct
                if (!RegExp(r'^\s*[0]{1,2}[7]{1,2}[7,8,9]{1,2}\d{7,8}')
                    .hasMatch(value)) {
                  return 'the phone number format is not correct, please try again';
                }
              }
              //validation of username existance
              // if (isUsername) {
              //   //TODO: check if username is already exists in database
              //   _validateUsername(() {
              //     if (userController.getIsUsernameExists) {
              //       uiController.setIsValidate(false);
              //       return 'the username ${textEditingController.text} is already exists, try another one';
              //     }
              //   });
              // }

              if (isEmail) {
                //validation of email format
                if (!EmailValidator.validate(value!)) {
                  return 'enter a valid email';
                }
                //validation of email existance //done by firebase
              }
            }
          },
          onTap: onTap,
        )));
  }
}
