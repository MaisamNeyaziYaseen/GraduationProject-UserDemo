import 'package:get/get.dart';

class MongoDbController extends GetxController {
  RxBool _isFetchingData = RxBool(false);
  RxBool _fetchData = RxBool(true);

  bool get getIsFetchingData => _isFetchingData.value;
  bool get getFetchData => _fetchData.value;

  setIsFetchingData(bool v) => _isFetchingData.value = v;
  setFetchData(bool v) => _fetchData.value = v;
}
