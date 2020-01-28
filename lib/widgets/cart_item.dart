import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tech_talk/currency_util.dart';
import 'package:tech_talk/data/cart.dart';
import 'package:tech_talk/providers/cart_provider.dart';

class CartItem extends StatelessWidget {
  final String cartId;

  const CartItem({Key key, this.cartId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context, listen: false);
    final cart = Provider.of<Cart>(context, listen: false);

    void _showSnackbar(String text) {
      Scaffold.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text(
            text,
            style: TextStyle(color: Colors.white),
          ),
        ),
      );
    }

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListTile(
        leading: Image.network(
          cart.imageUrl,
          fit: BoxFit.cover,
          width: 100,
        ),
        title: Text(cart.title),
        subtitle: Text(
          CurrencyUtil.formatToIDR(cart.price),
          style: Theme.of(context)
              .textTheme
              .body2
              .copyWith(color: Colors.lightBlue),
        ),
        trailing: Consumer<Cart>(
          builder: (ctx, cart, _) => Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              InkWell(
                child: Container(
                  color: (cart.qty < 30) ? Colors.green : Colors.grey,
                  width: 30,
                  height: 30,
                  child: Icon(Icons.add, color: Colors.white),
                ),
                onTap: () {
                  if (cart.qty < 30)
                    cartProvider.addQty(cartId);
                  else
                    _showSnackbar("Maksimum 30 per item");
                },
              ),
              Container(
                width: 30,
                height: 30,
                child: Center(
                  child: Text(cart.qty.toString()),
                ),
              ),
              InkWell(
                child: Container(
                  color: (cart.qty > 1) ? Colors.red : Colors.grey,
                  width: 30,
                  height: 30,
                  child: Icon(Icons.remove, color: Colors.white),
                ),
                onTap: () {
                  if (cart.qty > 1)
                    cartProvider.minusQty(cartId);
                  else
                    _showSnackbar("Item tidak bisa di hapus");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
