import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_demo/bindings/global_bindings.dart';
import 'package:user_demo/locals/message.dart';
import 'package:user_demo/testing.dart';
import 'package:user_demo/view/main_screens/get_started/sign_in.dart';
import 'package:user_demo/view/main_screens/get_started/sign_up.dart';
import 'package:user_demo/view/main_screens/home.dart';

//global

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  // SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  // print(MediaQueryData.fromWindow(WidgetsBinding.instance.window).size.width /
  //     MediaQueryData.fromWindow(WidgetsBinding.instance.window).size.height);
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      translations: Message(),
      locale: Get.deviceLocale,
      initialRoute: "/SignInScreen",
      getPages: [
        GetPage(
            name: "/SignInScreen",
            page: () => SignInScreen(),
            binding: GlobalBindings()),
        GetPage(
            name: "/SignUpScreen",
            page: () => SignUpScreen(),
            binding: GlobalBindings()),
        GetPage(
            name: "/HomeScreen",
            page: () => HomeScreen(),
            binding: GlobalBindings()),
        GetPage(name: "/Test", page: () => Test(), binding: GlobalBindings()),
      ],
    );
  }
}
