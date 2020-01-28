import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tech_talk/providers/product_provider.dart';
import 'package:tech_talk/widgets/product_item.dart';

class ProviderScreen extends StatefulWidget {
  static const routeName = "/provider-page";

  @override
  _ProviderScreenState createState() => _ProviderScreenState();
}

class _ProviderScreenState extends State<ProviderScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("Provider Demo"),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: productProvider.productList.length,
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 2 / 2.5,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemBuilder: (ctx, index) => ChangeNotifierProvider.value(
          value: productProvider.productList[index],
          child: ProductItem(),
        ),
      ),
    );
  }
}
