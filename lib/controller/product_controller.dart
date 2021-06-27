import 'package:get/state_manager.dart';
import 'package:my_store/product/product.dart';
import 'package:my_store/services/remote_service.dart';

class ProductController extends GetxController {
  var isLoading = true.obs;
  var productList = List<Product>().obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    try {
      isLoading(true);
      var products = await RemoteServices.fetchProducts();
      if (products != null) {
        productList.addAll(products);
      }
    } finally {
      isLoading(false);
    }
  }
}
