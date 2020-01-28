import 'package:flutter/foundation.dart';

class Cart with ChangeNotifier {
  final String title;
  final double price;
  final String imageUrl;
  int qty;

  Cart({this.title, this.price, this.imageUrl, this.qty = 1});

  void increaseQty() {
    qty++;
    notifyListeners();
  }

  void decreaseQty() {
    if (qty > 1) {
      qty--;
      notifyListeners();
    }
  }
}
