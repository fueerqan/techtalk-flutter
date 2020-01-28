import 'package:flutter/foundation.dart';

class Product with ChangeNotifier {
  final String id;
  final String name;
  final double price;
  final String imageUrl;
  bool isFavorite;

  Product(
      {this.id, this.name, this.price, this.imageUrl, this.isFavorite = false});

  void toggleFavorite() {
    isFavorite = !isFavorite;
    notifyListeners();
  }
}
