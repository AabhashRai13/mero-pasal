
import 'package:get/get.dart';
import 'package:pasal/app/constants/enums.dart';
import 'package:pasal/data/network/api_service_provider.dart';
import 'package:pasal/models/products.dart';
import 'package:pasal/presentation/base%20model/base_model.dart';

class ProductListController extends BaseController {
  final ApiServiceProvider _apiServiceProvider = ApiServiceProvider();
  final count = 0.obs;
  var productAvailable = false.obs;
  List productResponse = [].obs;
  bool tokenNeeded = false;
  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  void fetchProducts() async {
    setState(ViewState.busy);

    List<Product>? products = await _apiServiceProvider.getProduct();

    productResponse.assignAll(products!);
    productAvailable.value = products != null;
    setState(ViewState.retrieved);
  }

  @override
  void onClose() {}

  void increment() => count.value++;
}
