import 'package:user_demo/model/item_details.dart';

class Item {
  bool? onSale;
  double? saleFactor;
  String? state;
  int? quantity;
  double? price;
  ItemDetails? details;
  bool? isTryOn;
  String? modelUrl;
  List<String>? imgUrls;

  Item.fromJson(Map<String, dynamic> json) {
    onSale = json['on_sale'];
    saleFactor = json['sale_factor'].toDouble();
    state = json['state'];
    quantity = json['quantity'];
    price = json['price'].toDouble();
    details =
        json['details'] != null ? ItemDetails.fromJson(json['details']) : null;
    isTryOn = json['is_try_on'];
    modelUrl = json['model_url'];
    imgUrls = json['img_urls'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {};
    if (onSale != null) {
      data['on_sale'] = onSale;
    }
    if (saleFactor != null) {
      data['sale_factor'] = saleFactor;
    }
    if (state != null) {
      data['state'] = state;
    }
    if (quantity != null) {
      data['quantity'] = quantity;
    }
    if (price != null) {
      data['price'] = price;
    }
    if (details != null) {
      data['details'] = details!.toJson();
    }
    if (isTryOn != null) {
      data['is_try_on'] = isTryOn;
    }
    if (modelUrl != null) {
      data['model_url'] = modelUrl;
    }
    if (imgUrls != null) {
      data['img_urls'] = imgUrls;
    }
    return data;
  }
}
