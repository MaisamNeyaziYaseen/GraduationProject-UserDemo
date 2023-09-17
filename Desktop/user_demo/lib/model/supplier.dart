import 'package:mongo_dart/mongo_dart.dart';

class Supplier {
  ObjectId? id;
  String? name;

  Supplier.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    name = json['name'];
  }
}
