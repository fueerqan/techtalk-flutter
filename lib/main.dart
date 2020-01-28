import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tech_talk/providers/product_provider.dart';
import 'package:tech_talk/screens/main_screen.dart';
import 'package:tech_talk/screens/product_list_screen.dart';
import 'package:tech_talk/screens/stateful_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: ProductProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'TechTalk Demo',
        theme: ThemeData(
          primarySwatch: Colors.green,
          textTheme: TextTheme(
            button: TextStyle(
              color: Colors.white,
              fontSize: 18,
              letterSpacing: 1.5,
            ),
            body1: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            body2: TextStyle(
              fontSize: 18,
            ),
          ),
        ),
        routes: {
          '/': (_) => MainScreen(),
          StatefulScreen.routeName: (_) => StatefulScreen(),
          ProductListScreen.routeName: (_) => ProductListScreen(),
        },
      ),
    );
  }
}
