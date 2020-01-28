import 'package:flutter/foundation.dart';
import 'package:tech_talk/data/cart.dart';
import 'package:tech_talk/data/product.dart';

class CartProvider with ChangeNotifier {
  Map<String, Cart> _cartList = {};
  double _totalPrice = 0;

  double get totalPrice {
    return _totalPrice;
  }

  Map<String, Cart> get cartList {
    return {..._cartList};
  }

  void addToCart(Product product) {
    if (_cartList.containsKey(product.id)) {
      _cartList[product.id].increaseQty();
    } else {
      _cartList.putIfAbsent(
          product.id,
          () => Cart(
                title: product.name,
                price: product.price,
                imageUrl: product.imageUrl,
              ));
    }
    _totalPrice += product.price;
    notifyListeners();
  }

  void addQty(String productId) {
    _cartList[productId].increaseQty();
    _totalPrice += _cartList[productId].price;
    notifyListeners();
  }

  void minusQty(String productId) {
    _cartList[productId].decreaseQty();
    _totalPrice -= _cartList[productId].price;
    notifyListeners();
  }

  void removeFromCart(Product product) {
    if (_cartList[product.id].qty > 1) {
      _cartList[product.id].decreaseQty();
    }
    _totalPrice -= product.price;
    notifyListeners();
  }
}
