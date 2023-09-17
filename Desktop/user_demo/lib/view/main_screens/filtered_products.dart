import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_demo/controller/product_controller.dart';
import 'package:user_demo/model/product.dart';
import 'package:user_demo/view/components/product_holder.dart';

class FilteredProducts extends StatelessWidget {
  FilteredProducts({super.key, required this.filteredProducts});

  List<Product> filteredProducts;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 20,
                  childAspectRatio: (MediaQuery.of(context).size.width * 0.4) /
                      (MediaQuery.of(context).size.height * 0.3),
                ),
                itemCount: filteredProducts.length,
                itemBuilder: (c, i) =>
                    ProductHolder(product: filteredProducts[i]))));
  }
}
