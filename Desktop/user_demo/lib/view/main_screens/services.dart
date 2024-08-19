import 'package:flutter/material.dart';
import 'package:user_demo/controller/ui_controller.dart';
import 'package:user_demo/view/components/customized_app_bar.dart';
import 'package:user_demo/view/components/service_holder.dart';
import '../components/customized_bottom_navigation_bar.dart';

class ServicesScreen extends StatelessWidget {
  final UiController uiController = UiController();

  ServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomizedAppBarBuilder.buildCustomizedAppBar(context),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ServiceHolder(
                title: "Vision Tests",
                subTitle: "test your vision with us now",
                imgUrl: "assets/images/ui/vision_tests.jpg",
              ),
              ServiceHolder(
                  title: "Optometrists",
                  subTitle: "find near optometrists and book\nan appointment",
                  imgUrl: "assets/images/ui/optomtrist.jpg"),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomizedBottomNavigationBar(),
    );
  }
}
