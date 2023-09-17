import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_demo/controller/product_controller.dart';
import 'package:user_demo/controller/ui_controller.dart';
import 'package:user_demo/view/components/category_holder.dart';
import 'package:user_demo/view/components/customized_app_bar.dart';
import 'package:user_demo/view/components/customized_bottom_navigation_bar.dart';

class CategoriesScreen extends StatelessWidget {
  CategoriesScreen({super.key});
  final UiController _uiController = Get.find(tag: "ui_controller");
  ProductController productController = Get.find(tag: "product_controller");

  @override
  Widget build(BuildContext context) {
    print("in categories build");
    return Scaffold(
      appBar: CustomizedAppBarBuilder.buildCustomizedAppBar(context),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              CategoryHolder(
                category: "Sunglasses",
                imgUrl: "assets/images/ui/vision_tests.jpg",
              ),
              CategoryHolder(
                  category: "Glasses",
                  imgUrl: "assets/images/ui/optomtrist.jpg"),
              CategoryHolder(
                  category: "Women", imgUrl: "assets/images/ui/optomtrist.jpg"),
              CategoryHolder(
                  category: "Men", imgUrl: "assets/images/ui/optomtrist.jpg"),
              CategoryHolder(
                  category: "Kids", imgUrl: "assets/images/ui/optomtrist.jpg"),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomizedBottomNavigationBar(),
    );
  }
}
