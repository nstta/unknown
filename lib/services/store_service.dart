import 'package:unknown/constants/assets.dart';

class Product {
  final String name;
  final double price;
  final String image;

  Product({required this.name, required this.price, required this.image});
}

class StoreService {
  double _subtotal = 0.0;
  double _vat = 0.0;
  double _total = 0.0;

  double get subtotal => _subtotal;
  double get vat => _vat;
  double get total => _total;

  List<Product> products = [
    Product(name: 'Bread', price: 35.00, image: Assets.assetsImagesBread),
    Product(name: 'Burger', price: 90.00, image: Assets.assetsImagesBurgur),
    Product(name: 'Butter', price: 55.00, image: Assets.assetsImagesButter),
    Product(name: 'Chips', price: 30.00, image: Assets.assetsImagesChips),
    Product(
        name: 'Chocolate', price: 80.00, image: Assets.assetsImagesChocolate),
    Product(
        name: 'Doughnut', price: 40.00, image: Assets.assetsImagesDoughtnut),
    Product(name: 'Dumpling', price: 50.00, image: Assets.assetsImagesDumpling),
    Product(name: 'Egg', price: 5.00, image: Assets.assetsImagesEgg),
    Product(
        name: 'Fried Egg', price: 15.00, image: Assets.assetsImagesFriedegg),
    Product(name: 'Macaron', price: 50.00, image: Assets.assetsImagesMacaron),
    Product(name: 'Milk', price: 30.00, image: Assets.assetsImagesMilk),
    Product(name: 'Pancake', price: 40.00, image: Assets.assetsImagesPancake),
    Product(
        name: 'Rainbows Ice Cream',
        price: 80.00,
        image: Assets.assetsImagesRainbow),
    Product(name: 'Salad', price: 60.00, image: Assets.assetsImagesSalad),
    Product(name: 'Salapao', price: 30.00, image: Assets.assetsImagesSalapao),
    Product(name: 'Salmon', price: 250.00, image: Assets.assetsImagesSalmon),
    Product(
        name: 'Thai Milk Tea',
        price: 40.00,
        image: Assets.assetsImagesThaimilktea),
    Product(name: 'Vodka', price: 450.00, image: Assets.assetsImagesVodka),
    Product(name: 'Water', price: 10.00, image: Assets.assetsImagesWater),
    Product(name: 'Yakult', price: 12.00, image: Assets.assetsImagesYacult),
  ];

  Map<Product, int> selectedProducts = {};

  void addProductToReceipt(Product product) {
    if (selectedProducts.containsKey(product)) {
      selectedProducts[product] = selectedProducts[product]! + 1;
    } else {
      selectedProducts[product] = 1;
    }
  }

  void removeProductFromReceipt(Product product) {
    if (selectedProducts.containsKey(product) &&
        selectedProducts[product]! > 1) {
      selectedProducts[product] = selectedProducts[product]! - 1;
    } else {
      selectedProducts.remove(product);
    }
  }

  void clearSelectedProducts() {
    selectedProducts.clear();
  }

  double calculateTotal() {
    double total = 0.0;
    selectedProducts.forEach((product, count) {
      total += product.price * count;
    });
    _subtotal = total;
    _vat = total * 0.07;
    _total = _subtotal + _vat;
    return total;
  }
}
