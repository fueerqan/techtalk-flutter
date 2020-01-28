import 'package:flutter/foundation.dart';

import 'package:tech_talk/data/dummy_data.dart';
import 'package:tech_talk/data/product.dart';

class ProductProvider with ChangeNotifier {
  List<Product> _productList = DUMMY_PRODUCT;

  List<Product> get productList {
    return [..._productList];
  }

  void addProduct(Product product) {
    _productList.add(product);
    notifyListeners();
  }
}
