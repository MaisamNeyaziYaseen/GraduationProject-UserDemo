import 'package:get/get.dart';
import 'package:user_demo/model/product.dart';
import 'package:user_demo/services/monogdb/monogdb_atlas_service.dart';

class ProductController extends GetxController {
  RxList<Product> _productsList = <Product>[].obs;
  RxList<Product> _productsListWomen = <Product>[].obs;
  RxList<Product> _productsListMen = <Product>[].obs;
  RxList<Product> _productsListKids = <Product>[].obs;
  RxList<Product> _sunglasses = <Product>[].obs;
  RxList<Product> _sunglassesWomen = <Product>[].obs;
  RxList<Product> _sunglassesMen = <Product>[].obs;
  RxList<Product> _sunglasseskids = <Product>[].obs;
  RxList<Product> _glasses = <Product>[].obs;
  RxList<Product> _glassesWomen = <Product>[].obs;
  RxList<Product> _glassesMen = <Product>[].obs;
  RxList<Product> _glasseskids = <Product>[].obs;
  RxList<Product> _filteredProducts = <Product>[].obs;

  Future<void> retrieveAllProducts() async {
    await MongoDbAtlasService.createConnection();
    if (!MongoDbAtlasService.db!.isConnected) {
      await MongoDbAtlasService.connect();
    }
    List<Map<String, dynamic>> data =
        await MongoDbAtlasService.retrieveAllProducts();
    //products list

    _productsList.value = data.map((e) => Product.fromJson(e)).toList();

    await MongoDbAtlasService.close();
  }

  List<Product> getProductsList() => _productsList.value;
  List<Product> getProductsListWomen() => _productsListWomen.value;
  List<Product> getProductsListMen() => _productsListMen.value;
  List<Product> getProductsListKids() => _productsListKids.value;
  List<Product> getSunGlasses() => _sunglasses.value;
  List<Product> getSunglassesWomen() => _sunglassesWomen.value;
  List<Product> getSunglassesMen() => _sunglassesMen.value;
  List<Product> getSunglassesKids() => _sunglasseskids.value;
  List<Product> getGlasses() => _glasses.value;
  List<Product> getGlassesWomen() => _glassesWomen.value;
  List<Product> getGlassesMen() => _glassesMen.value;
  List<Product> getGlassesKids() => _glasseskids.value;
  List<Product> getFilteredProducts() => _filteredProducts.value;

  setProductsList(List<Product> v) => _productsList.value = v;
  setProductsListWomen(List<Product> v) => _productsListWomen.value = v;
  setProductsListMen(List<Product> v) => _productsListMen.value = v;
  setProductsListKids(List<Product> v) => _productsListKids.value = v;
  setSunglasses(List<Product> v) => _sunglasses.value = v;
  setSunglassesWomen(List<Product> v) => _sunglassesWomen.value = v;
  setSunglassesMen(List<Product> v) => _sunglassesMen.value = v;
  setSunglassesKids(List<Product> v) => _sunglasseskids.value = v;
  setGlasses(List<Product> v) => _glasses.value = v;
  setGlassesWomen(List<Product> v) => _glassesWomen.value = v;
  setGlassesMen(List<Product> v) => _glassesMen.value = v;
  setGlassesKids(List<Product> v) => _glasseskids.value = v;
  setFilteredProducts(List<Product> v) => _filteredProducts.value = v;
}
