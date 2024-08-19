import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_demo/controller/ui_controller.dart';
import 'package:user_demo/model/user.dart';
import 'package:user_demo/services/firebase/auth_service.dart';
import 'package:user_demo/services/monogdb/monogdb_atlas_service.dart';
import 'package:user_demo/utils/ui_constants.dart';
import 'package:user_demo/controller/user_controller.dart';
import 'package:user_demo/view/main_screens/get_started/get_started_header.dart';
import 'package:user_demo/view/main_screens/get_started/sign_in.dart';
import '../../../utils/enums.dart';
import '../../components/customized_text_field.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController _fNameController = TextEditingController();
  final TextEditingController _lNameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final UserController _userController = Get.find(tag: "user_controller");
  final UiController _uiController = Get.find(tag: "ui_controller");
  final AuthService _auth = AuthService();
  String? exception;
  // String firstName = "";
  // String lastName = "";
  // String username = "";
  // Gender? gender;
  // DateTime? dob;
  // String phoneNumber = "";
  // String email = "";
  // String password = "";
  // String confirmPassword = "";

  @override
  Widget build(BuildContext context) {
    return Obx(() => SafeArea(
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
                                  style: TextStyle(
                                      fontSize:
                                          48 * UiConstants.textScaleFactor,
                                      fontFamily:
                                          UiConstants.uiController.getFont),
                                ),
                                Text(
                                  "please, enter your data carefully".tr,
                                  style: TextStyle(
                                      fontSize:
                                          18 * UiConstants.textScaleFactor,
                                      fontFamily:
                                          UiConstants.uiController.getFont),
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.05,
                                ),
                                CustomizedTextField(
                                  formKey: _formKey,
                                  textEditingController: _fNameController,
                                  prefixIconData: Icons.person_outline,
                                  hintText: "first name".tr,
                                ),
                                CustomizedTextField(
                                  formKey: _formKey,
                                  textEditingController: _lNameController,
                                  prefixIconData: Icons.person_outline,
                                  hintText: "last name".tr,
                                ),
                                CustomizedTextField(
                                  formKey: _formKey,
                                  textEditingController: _usernameController,
                                  hintText: "username".tr,
                                  prefixIconData: Icons.person_outline,
                                  isUsername: true,
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.03,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "${"gender".tr}:",
                                      style: TextStyle(
                                          fontSize:
                                              16 * UiConstants.textScaleFactor,
                                          fontFamily:
                                              UiConstants.uiController.getFont),
                                    ),
                                  ],
                                ),
                                for (var g in Gender.values)
                                  Row(
                                    children: [
                                      Radio(
                                          value: g.name,
                                          groupValue:
                                              _userController.getGender.name,
                                          onChanged: (value) {
                                            _userController.setGender(
                                                value == "male"
                                                    ? Gender.male
                                                    : Gender.female);
                                            print(g.name);
                                            print(
                                                _userController.getGender.name);
                                          }),
                                      Text(
                                        g.name.tr,
                                        style: TextStyle(
                                            fontFamily: UiConstants
                                                .uiController.getFont),
                                      ),
                                    ],
                                  ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.03,
                                ),
                                ListTile(
                                  contentPadding:
                                      const EdgeInsets.symmetric(horizontal: 0),
                                  leading: const Icon(
                                    Icons.date_range_outlined,
                                    color: Colors.grey,
                                  ),
                                  title: Text(
                                    "date of birth".tr,
                                    style: TextStyle(
                                        fontFamily:
                                            UiConstants.uiController.getFont),
                                  ),
                                  subtitle: Text(
                                    _userController.getDOB == null
                                        ? ""
                                        : "${_userController.getDOB!.year}/${_userController.getDOB!.month}/${_userController.getDOB!.day}",
                                    style: TextStyle(
                                        fontFamily:
                                            UiConstants.uiController.getFont),
                                  ),
                                  onTap: () async {
                                    showDatePicker(
                                            context: context,
                                            initialDate: DateTime.now(),
                                            firstDate: DateTime(1940),
                                            lastDate: DateTime.now())
                                        .then((value) {
                                      if (value != null) {
                                        _userController.setDOB(value);
                                        print(value);
                                        print(_userController.getDOB);
                                      }
                                    });
                                  },
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.03,
                                ),
                                CustomizedTextField(
                                  formKey: _formKey,
                                  textEditingController: _phoneNumberController,
                                  hintText: "phone number".tr,
                                  prefixIconData: Icons.phone_outlined,
                                  textInputType: TextInputType.number,
                                  isRequired: false,
                                  isphone: true,
                                ),
                                CustomizedTextField(
                                  formKey: _formKey,
                                  textEditingController: _emailController,
                                  hintText: "email".tr,
                                  prefixIconData: Icons.mail_outline,
                                  textInputType: TextInputType.emailAddress,
                                  isEmail: true,
                                ),
                                CustomizedTextField(
                                  formKey: _formKey,
                                  textEditingController: _passwordController,
                                  hintText: "password".tr,
                                  prefixIconData: Icons.lock_outline,
                                  suffixIconData: Icons.remove_red_eye_outlined,
                                  isObsecure:
                                      UiConstants.uiController.getIsObsecure,
                                ),
                                CustomizedTextField(
                                  formKey: _formKey,
                                  textEditingController:
                                      _confirmPasswordController,
                                  hintText: "confirm password".tr,
                                  prefixIconData: Icons.lock_outline,
                                  suffixIconData: Icons.remove_red_eye_outlined,
                                  isObsecure:
                                      UiConstants.uiController.getIsObsecure,
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.03,
                                ),
                                ElevatedButton(
                                    onPressed: () async {
                                      _uiController.setIsProcessSignUp(true);
                                      //validation
                                      //form validation
                                      if (_formKey.currentState!.validate()) {
                                        //then
                                        //validate username existance
                                        await _userController
                                            .checkIfUsernameExists(
                                                _usernameController.text);
                                        if (_userController
                                            .getIsUsernameExists) {
                                          _uiController
                                              .setIsProcessSignUp(false);
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                            backgroundColor: Colors.red,
                                            content: Text(
                                                "username ${_usernameController.text} is already taken"
                                                    .tr,
                                                style: TextStyle(
                                                    fontFamily: UiConstants
                                                        .uiController.getFont)),
                                          ));
                                          //password matching validation
                                        } else if (_passwordController.text !=
                                            _confirmPasswordController.text) {
                                          _uiController
                                              .setIsProcessSignUp(false);
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                            backgroundColor: Colors.red,
                                            content: Text(
                                                "passwords are not matching".tr,
                                                style: TextStyle(
                                                    fontFamily: UiConstants
                                                        .uiController.getFont)),
                                          ));
                                        } else {
                                          //create new user
                                          //firebase will check if the email is already exists and through an exception if there be
                                          var user = await _auth
                                              .createUserWithEmailAndPassword(
                                                  _emailController.text,
                                                  _passwordController.text,
                                                  (e) {
                                            exception = e;
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(SnackBar(
                                              backgroundColor: Colors.red,
                                              content: Text(e.tr,
                                                  style: TextStyle(
                                                      fontFamily: UiConstants
                                                          .uiController
                                                          .getFont)),
                                            ));
                                          }, (user) async {
                                            //ensure registration
                                            if (user != null) {
                                              //account created
                                              //TODO: add user to the database

                                              await MongoDbAtlasService
                                                  .connect();
                                              await _userController
                                                  .createUser(User(
                                                firstName:
                                                    _fNameController.text,
                                                lastName: _lNameController.text,
                                                username:
                                                    _usernameController.text,
                                                birthDate:
                                                    _userController.getDOB,
                                                gender: _userController
                                                    .getGender
                                                    .toString(),
                                                phoneNumber:
                                                    _phoneNumberController.text,
                                                email: _emailController.text,
                                              ));
                                              await MongoDbAtlasService.close();
                                              _uiController
                                                  .setIsProcessSignUp(false);
                                              //feedback
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(SnackBar(
                                                      content: Text(
                                                "your account is created successfuly, sign in now"
                                                    .tr,
                                                style: TextStyle(
                                                    fontFamily: UiConstants
                                                        .uiController.getFont),
                                              )));
                                              Get.to(() => SignInScreen());
                                            }
                                          });
                                        }
                                      } else {
                                        _uiController.setIsProcessSignUp(false);
                                      }
                                    },
                                    style: ElevatedButton.styleFrom(
                                      shape: StadiumBorder(),
                                      elevation: 0,
                                      backgroundColor: UiConstants.mainColor,
                                    ),
                                    child: Container(
                                      alignment: Alignment.center,
                                      width: double.infinity,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.06,
                                      child: Text(
                                        "sign up".tr,
                                        style: TextStyle(
                                            fontSize: 18 *
                                                UiConstants.textScaleFactor,
                                            fontFamily: UiConstants
                                                .uiController.getFont),
                                      ),
                                    )),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.03,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  _uiController.getIsProcessSignUp
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
            bottomNavigationBar:
                //footer
                SizedBox(
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
                      Get.to(() => SignInScreen());
                    },
                    child: Text(
                      "sign in?".tr,
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
        ));
  }
}
