import 'package:flutter/foundation.dart';

class Product with ChangeNotifier {
  final String name;
  final String price;
  final String imageUrl;
  bool isFavorite;

  Product({this.name, this.price, this.imageUrl, this.isFavorite = false});

  void toggleFavorite() {
    isFavorite = !isFavorite;
    notifyListeners();
  }
}
