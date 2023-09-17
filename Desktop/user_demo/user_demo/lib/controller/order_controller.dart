import 'package:get/get.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:user_demo/model/location_info.dart';
import 'package:user_demo/model/order.dart';
import 'package:user_demo/model/user.dart';
import 'package:user_demo/services/monogdb/monogdb_atlas_service.dart';

class OrderController extends GetxController {
  RxList<Order> _orders = <Order>[].obs;
  RxDouble _total = RxDouble(0.0);

  //orders collection CRUD
  //C add order
  Future<void> addOrders(List<Order> orders) async {
    await MongoDbAtlasService.createConnection();
    if (!MongoDbAtlasService.db!.isConnected) {
      await MongoDbAtlasService.connect();
    }
    List<Map<String, dynamic>> data = [];
    for (Order order in orders) {
      data.add(order.toJson());
    }
    await MongoDbAtlasService.addOrders(data);
    await MongoDbAtlasService.close();
  }

  //R rerieve user orders
  Future<void> retrieveUserOrders(ObjectId id) async {
    await MongoDbAtlasService.createConnection();
    if (!MongoDbAtlasService.db!.isConnected) {
      await MongoDbAtlasService.connect();
    }
    List<Map<String, dynamic>> userOrders =
        await MongoDbAtlasService.retrieveuserOrders(id);
    List<Order> newOrders = [];
    for (Map<String, dynamic> order in userOrders) {
      newOrders.add(Order.fromJson(order));
    }

    _orders.value = newOrders;
    await MongoDbAtlasService.close();
  }

  //ui
  //add to orders
  addToOrdersList(
      ObjectId id,
      DateTime date,
      String paymentState,
      String deliveryState,
      User user,
      String country,
      String region,
      String county,
      String street,
      String building,
      String apartment) {
    Map<String, dynamic> data = {};

    LocationInfo locationInfo = LocationInfo(
        country: country,
        region: region,
        county: county,
        street: street,
        building: building,
        apartment: apartment);

    data['_id'] = id;
    data['date'] = date;
    data['payment_state'] = paymentState;
    data['delivery_state'] = deliveryState;
    data['items'] = user.cartList!.toList();
    data['user'] = user.toJson();
    data['location_information'] = locationInfo.toJson();
    data['total_cost'] = _total.value;

    _orders.value.add(Order.fromJson(data));
  }

  //getters
  List<Order> get getOrdersList => _orders.value;
  double get getTotal => _total.value;

  //setters
  setOrdersList(List<Order> v) => _orders.value = v;
  setTotal(double v) => _total.value = v;
}
