import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_demo/utils/ui_constants.dart';
import 'package:user_demo/view/main_screens/category_datails.dart';

class CategoryHolder extends StatelessWidget {
  CategoryHolder({super.key, required this.category, required this.imgUrl});
  final String category;
  final String imgUrl;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            height: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              color: Colors.grey,
            ),
            child: Image(
              image: AssetImage(imgUrl),
              fit: BoxFit.fill,
            )),
        InkWell(
          onTap: () {
            Get.to(() => CategoryDetails(
                  category: category,
                ));
          },
          child: Container(
            alignment: Alignment.center,
            height: MediaQuery.of(context).size.width,
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
            child: Text(
              category.tr,
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: UiConstants.uiController.getFont,
                  fontSize: 30),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}
