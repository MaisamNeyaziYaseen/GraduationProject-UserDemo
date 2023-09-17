import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_demo/controller/ui_controller.dart';
import 'package:user_demo/controller/user_controller.dart';
import 'package:user_demo/services/firebase/auth_service.dart';
import 'package:user_demo/utils/ui_constants.dart';
import 'package:user_demo/view/components/customized_text_field.dart';
import 'package:user_demo/view/main_screens/get_started/get_started_header.dart';
import 'package:user_demo/view/main_screens/get_started/sign_up.dart';
import 'package:user_demo/view/main_screens/home.dart';

class SignInScreen extends StatelessWidget {
  final AuthService _auth = AuthService();
  final UiController _uiController =
      Get.find<UiController>(tag: "ui_controller");
  final UserController _userController = Get.find(tag: "user_controller");
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Obx(
          () => Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    const GetStartedHeader(),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            Text(
                              "welcome".tr,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 48 * UiConstants.textScaleFactor,
                                  fontFamily: UiConstants.uiController.getFont),
                            ),
                            Text(
                              "please, enter your data carefully".tr,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 18 * UiConstants.textScaleFactor,
                                  fontFamily: UiConstants.uiController.getFont),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.05,
                            ),
                            CustomizedTextField(
                              formKey: _formKey,
                              textEditingController: _emailController,
                              hintText: "email".tr,
                              prefixIconData: Icons.mail_outlined,
                              isEmail: true,
                              textInputType: TextInputType.emailAddress,
                            ),
                            CustomizedTextField(
                              formKey: _formKey,
                              textEditingController: _passwordController,
                              hintText: "password".tr,
                              prefixIconData: Icons.lock_outline,
                              suffixIconData: Icons.remove_red_eye_outlined,
                              isObsecure: true,
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.03,
                            ),
                            ElevatedButton(
                              onPressed: () async {
                                _uiController.setIsProcessSignIn(true);
                                //validation
                                if (_formKey.currentState!.validate()) {
                                  await _auth.signInWithEmailAndPassword(
                                      _emailController.text,
                                      _passwordController.text, (e) {
                                    _uiController.setIsProcessSignIn(false);
                                    print("e: $e");
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                            content: Text(
                                      e.tr,
                                      style: TextStyle(
                                          fontFamily:
                                              UiConstants.uiController.getFont),
                                    )));
                                  },
                                      //ensure sign in
                                      (user) async {
                                    if (user != null) {
                                      //user signed in
                                      _uiController.setIsProcessSignIn(false);
                                      print("user is signed in");
                                      _userController
                                          .setEmail(_emailController.text);
                                      _uiController.setIsProcessSignIn(false);
                                      Get.offAll(() => HomeScreen());
                                    }
                                  });
                                } else {
                                  _uiController.setIsProcessSignIn(false);
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                shape: StadiumBorder(),
                                backgroundColor: UiConstants.mainColor,
                                elevation: 0,
                              ),
                              child: Container(
                                  alignment: Alignment.center,
                                  width: double.infinity,
                                  height:
                                      MediaQuery.of(context).size.height * 0.06,
                                  child: Text(
                                    "sign in",
                                    style: TextStyle(
                                        fontSize:
                                            18 * UiConstants.textScaleFactor,
                                        fontFamily:
                                            UiConstants.uiController.getFont),
                                  )),
                            ),
                            IconButton(
                                onPressed: () {
                                  if (UiConstants.uiController.getLocale ==
                                      const Locale("en")) {
                                    UiConstants.uiController
                                        .setLocale(const Locale("ar"));
                                    UiConstants.uiController
                                        .setFont("sst_arabic_roman");
                                    Get.updateLocale(
                                        UiConstants.uiController.getLocale);
                                  } else if (UiConstants
                                          .uiController.getLocale ==
                                      const Locale("ar")) {
                                    UiConstants.uiController
                                        .setLocale(const Locale("en"));
                                    UiConstants.uiController
                                        .setFont("varela_round");
                                    Get.updateLocale(
                                        UiConstants.uiController.getLocale);
                                  }

                                  print(UiConstants.uiController.getLocale);
                                  print(UiConstants.uiController.getFont);
                                  print(Get.deviceLocale);
                                },
                                icon: const Icon(Icons.language)),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              _uiController.getIsProcessSignIn
                  ? Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      height: double.infinity,
                      color: Colors.black.withOpacity(0.5),
                      child: CircularProgressIndicator(),
                    )
                  : Container(),
            ],
          ),
        ),
        //footer
        bottomNavigationBar: SizedBox(
          height: MediaQuery.of(context).size.height * 0.08,
          child: Row(
            children: [
              const Expanded(
                child: Divider(
                  indent: 20,
                  endIndent: 10,
                  thickness: 2,
                ),
              ),
              InkWell(
                onTap: () {
                  Get.to(() => SignUpScreen());
                },
                child: Text(
                  "sign up?".tr,
                  style: TextStyle(
                      color: UiConstants.mainColor,
                      fontFamily: UiConstants.uiController.getFont),
                ),
              ),
              const Expanded(
                child: Divider(
                  indent: 10,
                  endIndent: 10,
                  thickness: 2,
                ),
              ),
              InkWell(
                onTap: () {
                  //show dialog box
                  showDialog(
                      context: context,
                      builder: (context) => SimpleDialog(
                            contentPadding: EdgeInsets.all(40),
                            children: [
                              Column(
                                children: [
                                  Text(
                                      "Enter your email, and then wait for you reset password link"),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  TextField(
                                    controller: _emailController,
                                    decoration: InputDecoration(
                                        enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.grey))),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  ElevatedButton(
                                    onPressed: () async {
                                      await AuthService.sendEmailPasswordReset(
                                          _emailController.text, (e) {
                                        Navigator.pop(context);
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                                SnackBar(content: Text("$e")));
                                      }, (sent) {
                                        if (sent) {
                                          Navigator.pop(context);
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                                  content: Text(
                                                      "a linke sent to your email")));
                                        }
                                      });
                                    },
                                    child: Text("Send me the link"),
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: UiConstants.mainColor),
                                  )
                                ],
                              )
                            ],
                          ));
                },
                child: Text(
                  "forgot password?".tr,
                  style: TextStyle(
                      color: UiConstants.mainColor,
                      fontFamily: UiConstants.uiController.getFont),
                ),
              ),
              const Expanded(
                child: Divider(
                  indent: 10,
                  endIndent: 20,
                  thickness: 2,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
