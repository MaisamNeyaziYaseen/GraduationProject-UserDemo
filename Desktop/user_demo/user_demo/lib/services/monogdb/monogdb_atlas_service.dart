import 'package:mongo_dart/mongo_dart.dart';
import 'package:user_demo/model/user.dart';

class MongoDbAtlasService {
  static Db? db;

  //create conection
  static Future<void> createConnection() async {
    print("in create connection");
    db = await Db.create(
        "mongodb+srv://Maisam:Maisam1234@cluster0.4h9ch0h.mongodb.net/GraduationProjectDB/");
  }

  //connect db
  static Future<void> connect() async {
    print("in connect");
    await db!.open();

    if (db!.isConnected) {
      print("connected to db");
    }
  }

  //close connection
  static Future<void> close() async {
    if (db!.isConnected) {
      await db!.close();
      if (!db!.isConnected) {
        print("db closed");
      }
    }
  }

  //producs collection CRUD
  //R rerieve all products
  static Future<List<Map<String, dynamic>>> retrieveAllProducts() async {
    DbCollection collection = db!.collection("products");
    return await collection.find().toList();
  }

  //users collection CRUD
  //R retrieve user by email
  static Future<Map<String, dynamic>?> retrieveUserByEmail(String email) async {
    DbCollection collection = db!.collection("users");
    return await collection.findOne(where.eq("email", email));
  }

  //R check if username exists
  static Future<Map<String, dynamic>?> checkIfUsernameExists(
      String username) async {
    DbCollection collection = db!.collection('users');
    return await collection.findOne(where.eq("username", username));
  }

  //C create user
  static Future<void> createUser(Map<String, dynamic> data) async {
    DbCollection collection = db!.collection('users');
    await collection.insertOne(data);
  }

  //U add to wish list
  // static Future<void> addToWishList(ObjectId userId, ObjectId productId) async {
  //   DbCollection collection = db!.collection('users');
  //   await collection.update(
  //       where.eq('_id', userId), modify.push('wish_list', productId));
  // }

  //U update user
  static Future<void> updateUser(ObjectId userId, User user) async {
    DbCollection collection = db!.collection('users');
    await collection.update(where.eq('_id', userId), user.toJson());
  }

  //Orders collection
  //R retrieve user orders
  static Future<List<Map<String, dynamic>>> retrieveuserOrders(
      ObjectId id) async {
    DbCollection collection = db!.collection('orders');

    List<Map<String, dynamic>> allOrders = await collection.find().toList();
    List<Map<String, dynamic>> userOrders = [];

    for (Map<String, dynamic> order in allOrders) {
      if (order['user']['_id'] == id) {
        userOrders.add(order);
      }
    }

    return userOrders;
  }

  //C add order
  static Future<void> addOrders(List<Map<String, dynamic>> orders) async {
    DbCollection ordersCollection = db!.collection('orders');
    await ordersCollection.insertMany(orders);
  }
}
