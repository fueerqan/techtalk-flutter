import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tech_talk/providers/cart_provider.dart';
import 'package:tech_talk/widgets/cart_item.dart';
import 'package:tech_talk/widgets/total_price.dart';

class ConsumerScreen extends StatefulWidget {
  static const routeName = "/consumer-page";
  @override
  _ConsumerScreenState createState() => _ConsumerScreenState();
}

class _ConsumerScreenState extends State<ConsumerScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context, listen: false);
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("Consumer Demo"),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: cartProvider.cartList.length,
              itemBuilder: (ctx, index) => ChangeNotifierProvider.value(
                value: cartProvider.cartList.values.toList()[index],
                child: CartItem(
                  cartId: cartProvider.cartList.keys.toList()[index],
                ),
              ),
            ),
          ),
          TotalPrice(),
        ],
      ),
    );
  }
}
