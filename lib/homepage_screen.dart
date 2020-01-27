import 'package:flutter/material.dart';

class HomepageScreen extends StatefulWidget {
  @override
  _HomepageScreenState createState() => _HomepageScreenState();
}

class _HomepageScreenState extends State<HomepageScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  String text = "Klik tombol untuk mengubah tulisan.";

  void _onButtonClicked() {
    setState(() {
      text = "Selamat datang di TechTalk";
    });
    _scaffoldKey.currentState.showSnackBar(
      SnackBar(
        content: Text(text),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("TechTalk Demo"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(text),
            RaisedButton(
              child: Text("Click Me!"),
              onPressed: _onButtonClicked,
            ),
          ],
        ),
      ),
    );
  }
}
