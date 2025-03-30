import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:unknown/app/app.locator.dart';
import 'package:unknown/app/app.router.dart';
import 'package:unknown/services/store_service.dart';

class ReceiptViewModel extends BaseViewModel {
  final _routerService = locator<RouterService>();
  final _storeService = locator<StoreService>();

  List<Product> get products => _storeService.products;
  Map<Product, int> get selectedProducts => _storeService.selectedProducts;

  void addProductToReceipt(Product product) {
    _storeService.addProductToReceipt(product);
    notifyListeners();
  }

  void removeProductFromReceipt(Product product) {
    _storeService.removeProductFromReceipt(product);
    notifyListeners();
  }

  void clearSelectedProducts() {
    _storeService.clearSelectedProducts();
    notifyListeners();
  }

  double calculateTotal() {
    return _storeService.calculateTotal();
  }

  void navigateToPayment() {
    _routerService.navigateToSlipView();
  }
}
