import 'package:flutter/material.dart';

class StatefulScreen extends StatefulWidget {
  static const routeName = "/stateful-page";

  @override
  _StatefulScreenState createState() => _StatefulScreenState();
}

class _StatefulScreenState extends State<StatefulScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  int _clickCounter = 0;

  bool get _showDoorprize {
    return _clickCounter > 0 && (_clickCounter % 15) == 0;
  }

  void _onButtonClicked() {
    setState(() {
      _clickCounter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final _doorprizeWidget = [
      Image.asset("assets/images/gift.png"),
      Text(
        "Congratulation, you got a Doorprize!",
        style: Theme.of(context).textTheme.body1,
        textAlign: TextAlign.center,
      ),
      SizedBox(height: 16),
    ];

    final Widget _buttonWidget = InkWell(
      onTap: _onButtonClicked,
      child: Card(
        elevation: 4.0,
        color: Theme.of(context).primaryColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(
                Icons.add,
                color: Colors.white,
              ),
              SizedBox(width: 10),
              Text(
                "Click Me!",
                style: Theme.of(context).textTheme.button,
              ),
            ],
          ),
        ),
      ),
    );

    final _counterWidget = [
      SizedBox(
        height: 16,
      ),
      Text(
        "Clicked $_clickCounter times.",
        style: Theme.of(context).textTheme.body2,
      ),
    ];

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("Stateful Demo"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              if (_showDoorprize) ..._doorprizeWidget,
              _buttonWidget,
              if (_clickCounter > 0) ..._counterWidget,
            ],
          ),
        ),
      ),
    );
  }
}
