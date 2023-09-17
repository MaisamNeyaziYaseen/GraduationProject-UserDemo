import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_demo/controller/product_controller.dart';
import 'package:user_demo/controller/ui_controller.dart';
import 'package:user_demo/model/product.dart';
import 'package:user_demo/view/main_screens/filtered_products.dart';

class CategoryDetails extends StatefulWidget {
  CategoryDetails({super.key, required this.category});
  String category;

  @override
  State<CategoryDetails> createState() =>
      _CategoryDetailsState(category: category);
}

class _CategoryDetailsState extends State<CategoryDetails> {
  _CategoryDetailsState({required this.category});
  String category;
  UiController _uiController = Get.find(tag: "ui_controller");
  ProductController _productController = Get.find(tag: "product_controller");

  @override
  void initState() {
    super.initState();
    _getData();
  }

  _getData() {
    //sunglasses//all
    if (_productController.getSunGlasses().isEmpty) {
      _getSunGlasses();
    }

    //sunglasses/women
    if (_productController.getSunglassesWomen().isEmpty) {
      _getSunglassesWomen();
    }
    //sunglasses/men
    if (_productController.getSunglassesMen().isEmpty) {
      _getSunglassesMen();
    }
    //sunglasses/kids
    if (_productController.getSunglassesKids().isEmpty) {
      _getSunglassesKids();
    }
    //glasses/all
    if (_productController.getGlasses().isEmpty) {
      _getGlasses();
    }
    //glasses/women
    if (_productController.getGlassesWomen().isEmpty) {
      _getGlassesWomen();
    }
    //glasses/men
    if (_productController.getGlassesMen().isEmpty) {
      _getGlassesMen();
    }
    //glasses/kids
    if (_productController.getGlassesKids().isEmpty) {
      _getGlassesKids();
    }
    //women
    if (_productController.getProductsListWomen().isEmpty) {
      _getProductsWomen();
    }
    //men
    if (_productController.getProductsListMen().isEmpty) {
      _getProductsMen();
    }
    //kids
    if (_productController.getProductsListKids().isEmpty) {
      _getProductsKids();
    }
  }

  //sunglasses
  _getSunGlasses() {
    var sunglasses = <Product>{};
    for (Product p in _productController.getProductsList()) {
      if (p.type! == "Sunglasses") {
        sunglasses.add(p);
      }
    }
    _productController.setSunglasses(sunglasses.toList());
  }

  //sunglasses/women
  _getSunglassesWomen() {
    var sunglassesWomen = <Product>{};
    for (Product p in _productController.getProductsList()) {
      if (p.type! == "Sunglasses" && p.gender!.any((e) => e == "Female")) {
        sunglassesWomen.add(p);
      }
    }
    _productController.setSunglassesWomen(sunglassesWomen.toList());
  }

  //sunglasses/men
  _getSunglassesMen() {
    var sunglasseMen = <Product>{};
    for (Product p in _productController.getProductsList()) {
      if (p.type! == "Sunglasses" && p.gender!.any((e) => e == "Male")) {
        sunglasseMen.add(p);
      }
    }
    _productController.setSunglassesMen(sunglasseMen.toList());
  }

  //sunglasses/kids
  _getSunglassesKids() {
    var sunglasseKids = <Product>{};
    for (Product p in _productController.getProductsList()) {
      if (p.type! == "Sunglasses" && p.age!.any((e) => e == "Kids")) {
        sunglasseKids.add(p);
      }
    }
    _productController.setSunglassesKids(sunglasseKids.toList());
  }

  //glasses
  _getGlasses() {
    var glasses = <Product>{};
    for (Product p in _productController.getProductsList()) {
      if (p.type! == "Glasses") {
        glasses.add(p);
      }
    }
    _productController.setGlasses(glasses.toList());
  }

  //glasses/women
  _getGlassesWomen() {
    var glassesWomen = <Product>{};
    for (Product p in _productController.getProductsList()) {
      if (p.type! == "Glasses" && p.gender!.any((e) => e == "Female")) {
        glassesWomen.add(p);
      }
    }

    _productController.setGlassesWomen(glassesWomen.toList());
  }

  //glasses/men
  _getGlassesMen() {
    var glassesMen = <Product>{};
    for (Product p in _productController.getProductsList()) {
      if (p.type! == "Glasses" && p.gender!.any((e) => e == "Male")) {
        glassesMen.add(p);
      }
    }
    _productController.setGlassesMen(glassesMen.toList());
  }

  //glasses/kids
  _getGlassesKids() {
    var glassesKids = <Product>{};
    for (Product p in _productController.getProductsList()) {
      if (p.type! == "Glasses" && p.age!.any((e) => e == "Kids")) {
        glassesKids.add(p);
      }
    }
    _productController.setGlassesKids(glassesKids.toList());
  }

  //women
  _getProductsWomen() {
    var productsWomen = <Product>{};
    for (Product p in _productController.getProductsList()) {
      if (p.gender!.any((e) => e == "Female")) {
        productsWomen.add(p);
      }
    }
    _productController.setProductsListWomen(productsWomen.toList());
  }

  //men
  _getProductsMen() {
    var productsMen = <Product>{};
    for (Product p in _productController.getProductsList()) {
      if (p.gender!.any((e) => e == "Male")) {
        productsMen.add(p);
      }
    }
    _productController.setProductsListMen(productsMen.toList());
  }

  //products/kids
  _getProductsKids() {
    var productsKids = <Product>{};
    for (Product p in _productController.getProductsList()) {
      if (p.age!.any((e) => e == "Kids")) {
        productsKids.add(p);
      }
    }
    _productController.setProductsListKids(productsKids.toList());
  }

  Widget _buildFilterView() {
    if (category == "Sunglasses") {
      return DefaultTabController(
        length: 4,
        child: Column(
          children: [
            TabBar(
                unselectedLabelColor: Colors.grey,
                labelColor: Colors.black,
                tabs: [
                  Tab(
                    child: Text(
                      "All".tr,
                      style: TextStyle(fontFamily: _uiController.getFont),
                    ),
                  ),
                  Tab(
                    child: Text(
                      "Women".tr,
                      style: TextStyle(fontFamily: _uiController.getFont),
                    ),
                  ),
                  Tab(
                    child: Text(
                      "Men".tr,
                      style: TextStyle(fontFamily: _uiController.getFont),
                    ),
                  ),
                  Tab(
                    child: Text(
                      "Kids".tr,
                      style: TextStyle(fontFamily: _uiController.getFont),
                    ),
                  ),
                ]),
            Expanded(
              child: TabBarView(children: [
                FilteredProducts(
                  filteredProducts: _productController.getSunGlasses(),
                ),
                FilteredProducts(
                  filteredProducts: _productController.getSunglassesWomen(),
                ),
                FilteredProducts(
                  filteredProducts: _productController.getSunglassesMen(),
                ),
                FilteredProducts(
                  filteredProducts: _productController.getSunglassesKids(),
                ),
              ]),
            )
          ],
        ),
      );
    } else if (category == "Glasses") {
      return DefaultTabController(
        length: 4,
        child: Column(
          children: [
            TabBar(
                unselectedLabelColor: Colors.grey,
                labelColor: Colors.black,
                tabs: [
                  Tab(
                    child: Text(
                      "All".tr,
                      style: TextStyle(fontFamily: _uiController.getFont),
                    ),
                  ),
                  Tab(
                    child: Text(
                      "Women".tr,
                      style: TextStyle(fontFamily: _uiController.getFont),
                    ),
                  ),
                  Tab(
                    child: Text(
                      "Men".tr,
                      style: TextStyle(fontFamily: _uiController.getFont),
                    ),
                  ),
                  Tab(
                    child: Text(
                      "Kids".tr,
                      style: TextStyle(fontFamily: _uiController.getFont),
                    ),
                  ),
                ]),
            Expanded(
              child: TabBarView(children: [
                FilteredProducts(
                  filteredProducts: _productController.getGlasses(),
                ),
                FilteredProducts(
                  filteredProducts: _productController.getGlassesWomen(),
                ),
                FilteredProducts(
                  filteredProducts: _productController.getGlassesMen(),
                ),
                FilteredProducts(
                  filteredProducts: _productController.getGlassesKids(),
                ),
              ]),
            )
          ],
        ),
      );
    } else if (category == "Women") {
      return FilteredProducts(
        filteredProducts: _productController.getProductsListWomen(),
      );
    } else if (category == "Men") {
      return FilteredProducts(
        filteredProducts: _productController.getProductsListMen(),
      );
    } else if (category == "Kids") {
      return FilteredProducts(
        filteredProducts: _productController.getProductsListKids(),
      );
    } else {
      return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _buildFilterView(),
      ),
    );
  }
}
