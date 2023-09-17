import 'package:get/get.dart';
import 'package:user_demo/controller/monogdb_controller.dart';
import 'package:user_demo/controller/order_controller.dart';
import 'package:user_demo/controller/product_controller.dart';
import 'package:user_demo/controller/ui_controller.dart';

import '../controller/user_controller.dart';

class GlobalBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(UiController(), tag: "ui_controller", permanent: true);
    Get.put(ProductController(), tag: "product_controller", permanent: true);
    Get.put(UserController(), tag: "user_controller", permanent: true);
    Get.put(OrderController(), tag: "order_controller", permanent: true);
    Get.put(MongoDbController(), tag: "mongodb_controller", permanent: true);
  }
}
