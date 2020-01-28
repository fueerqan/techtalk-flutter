import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tech_talk/currency_util.dart';
import 'package:tech_talk/providers/cart_provider.dart';

class TotalPrice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: Colors.orange, border: Border.all()),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          const Expanded(
            child: const Text(
              "Total Price",
              style: TextStyle(color: Colors.white),
            ),
          ),
          Consumer<CartProvider>(
            builder: (ctx, cartProvider, _) => Text(
              CurrencyUtil.formatToIDR(cartProvider.totalPrice),
              style: Theme.of(context)
                  .textTheme
                  .body1
                  .copyWith(color: Colors.lightBlue),
            ),
          ),
        ],
      ),
    );
  }
}
