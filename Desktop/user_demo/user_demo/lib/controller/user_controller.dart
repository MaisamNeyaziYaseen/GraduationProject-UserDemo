import 'package:get/get.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:user_demo/model/item.dart';
import 'package:user_demo/model/order.dart';
import 'package:user_demo/model/user.dart';
import 'package:user_demo/services/monogdb/monogdb_atlas_service.dart';
import '../utils/enums.dart';
import 'package:user_demo/model/location_info.dart';

class UserController extends GetxController {
  //TODO: reconstruct controller (_dob,_gender)
  //inside the app only
  final Rx<DateTime?> _dob = DateTime.now().obs;
  final Rx<Gender> _gender = Gender.male.obs;
  RxString _email = RxString("");
  RxBool _isUsernameExists = RxBool(false);
  // RxSet<Product> _wishList = <Product>{}.obs;
  // RxList<Product> _cartList = <Product>[].obs;
  Rx<User> _user = User().obs;
  RxBool _refreshUi = RxBool(false);

  //users collection CRUD
  //R retrieve user by email
  Future<void> retrieveUserByEmail(String email) async {
    await MongoDbAtlasService.createConnection();
    if (!MongoDbAtlasService.db!.isConnected) {
      await MongoDbAtlasService.connect();
    }
    Map<String, dynamic>? data =
        await MongoDbAtlasService.retrieveUserByEmail(email);
    if (data != null) {
      setUser(User.fromJson(data));
    }
    await MongoDbAtlasService.close();
  }

  //R check if username exists
  Future<void> checkIfUsernameExists(String username) async {
    await MongoDbAtlasService.createConnection();
    if (!MongoDbAtlasService.db!.isConnected) {
      await MongoDbAtlasService.connect();
    }
    setIsUsernameExists(
        await MongoDbAtlasService.checkIfUsernameExists(username) == null
            ? false
            : true);
    await MongoDbAtlasService.close();
  }

  //C create user
  Future<void> createUser(User user) async {
    await MongoDbAtlasService.createConnection();
    if (!MongoDbAtlasService.db!.isConnected) {
      await MongoDbAtlasService.connect();
    }
    await MongoDbAtlasService.createUser(user.toJson());
    await MongoDbAtlasService.close();
  }

  //U update user
  Future<void> updateUser(ObjectId userId, User user) async {
    await MongoDbAtlasService.createConnection();
    if (!MongoDbAtlasService.db!.isConnected) {
      await MongoDbAtlasService.connect();
    }
    await MongoDbAtlasService.updateUser(userId, user);
    await MongoDbAtlasService.close();
  }

  //ui
  //add to wish list
  addToWishList(ObjectId productId) async {
    _user.value.wishList!.add(productId);
    refresh();
  }

  //remove from wish list
  removeFromWishList(ObjectId id) {
    _user.value.wishList!.removeWhere((e) => e == id);
    refresh();
  }

  //add to cart list
  addToCartList(ObjectId productId, ObjectId supplierId, String type, Item item,
      {String? lensesType,
      String? lensesSubtype,
      Map<String, dynamic>? leftLens,
      Map<String, dynamic>? rightLens,
      double? lensesPrice}) {
    bool isExist = false;

    for (int i = 0; i < _user.value.cartList!.length; i++) {
      if (_user.value.cartList!.toList()[i]['product_id'] == productId &&
          _user.value.cartList!.toList()[i]['item']['details']['frame_color'] ==
              item.details!.frameColor &&
          _user.value.cartList!.toList()[i]['item']['details']['lens_color'] ==
              item.details!.lensColor) {
        print("is exist");
        _user.value.cartList!.toList()[i]['quantity']++;
        isExist = true;
        break;
      }
    }

    if (!isExist) {
      if (type == "Sunglasses") {
        Map<String, dynamic> data = {};
        data['product_id'] = productId.toJson();
        data['supplier_id'] = supplierId;
        data['quantity'] = 1;
        data['type'] = type;
        data['item'] = item.toJson();
        _user.value.cartList!.add(data);
      } else if (type == "Glasses") {
        Map<String, dynamic> data = {};
        data['product_id'] = productId;
        data['quantity'] = 1;
        data['type'] = type;
        data['lenses_subtype'] = lensesSubtype;
        data['item'] = item.toJson();
        data['lenses_type'] = lensesType;
        data['lenses_subtype'] = lensesSubtype;
        data['left_lens'] = leftLens;
        data['right_lens'] = rightLens;
        data['lenses_price'] = lensesPrice;
        _user.value.cartList!.add(data);
      }
    }
  }

  //repeat to cart list
  repeatToCartList(int index) {
    _user.value.cartList!.toList()[index]['quantity']++;
  }

  //remove from cart list
  removefromCartList(int index) {
    if (_user.value.cartList!.toList()[index]['quantity'] == 1) {
      print("in delete");
      _user.value.cartList!.remove(_user.value.cartList!.toList()[index]);
      print(_user.value.cartList!.length);
    } else {
      _user.value.cartList!.toList()[index]['quantity']--;
    }
  }

  //getters
  DateTime? get getDOB => _dob.value;
  Gender get getGender => _gender.value;
  String get getEmail => _email.value;
  User get getUser => _user.value;
  bool get getIsUsernameExists => _isUsernameExists.value;
  bool get getRefreshUi => _refreshUi.value;

  //setters
  setDOB(DateTime? v) => _dob.value = v;
  setGender(Gender v) => _gender.value = v;
  setEmail(String v) => _email.value = v;
  setUser(User v) => _user.value = v;
  setIsUsernameExists(bool v) => _isUsernameExists.value = v;
  setRefreshUI(bool v) => _refreshUi.value = v;
}
