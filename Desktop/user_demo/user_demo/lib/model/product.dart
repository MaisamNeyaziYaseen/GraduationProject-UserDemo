import 'package:mongo_dart/mongo_dart.dart';
import 'supplier.dart';
import 'item.dart';

class Product {
  ObjectId? id;
  String? title;
  String? description;
  Supplier? supplier;
  String? type;
  List<String>? gender;
  List<String>? age;
  List<Item>? items = [];
  bool isFavorite = false;

  bool get getIsFavorite => isFavorite;

  setIsFavorite(bool v) => isFavorite = v;

  Product.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    title = json['title'];
    description = json['description'];
    supplier = Supplier.fromJson(json['supplier']);
    type = json['type'];
    gender = json['gender'].cast<String>();
    age = json['age'].cast<String>();
    items = <Item>[];
    if (json['items'] != null) {
      json['items'].forEach((v) {
        items!.add(Item.fromJson(v));
      });
    }
  }
}
