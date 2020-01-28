import 'package:flutter/material.dart';
import 'package:tech_talk/screens/stateful_screen.dart';

class MainScreen extends StatelessWidget {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  void _onStatelessButtonClicked() {
    showDialog(
      context: _scaffoldKey.currentContext,
      child: AlertDialog(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(Icons.warning),
            SizedBox(width: 10),
            Text("Staless Widget"),
          ],
        ),
        contentPadding: const EdgeInsets.all(16),
        content: Text("Halaman utama ini adalah contoh Stateless Widget"),
        actions: <Widget>[
          FlatButton(
            child: Text("OK"),
            onPressed: () =>
                Navigator.of(_scaffoldKey.currentContext, rootNavigator: true)
                    .pop(),
          )
        ],
      ),
    );
  }

  void _navigateToScreen(String routeName) {
    Navigator.of(_scaffoldKey.currentContext).pushNamed(routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("TechTalk Demo"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  RaisedButton(
                    color: Colors.green,
                    // Container is used to make the button have custom width and height
                    child: Container(
                      height: 120,
                      width: 120,
                      // Center is used to make the child inside it is centered in Container
                      child: Center(
                        child: Text(
                          "Stateless",
                          style: Theme.of(context).textTheme.button,
                        ),
                      ),
                    ),
                    onPressed: _onStatelessButtonClicked,
                  ),
                  RaisedButton(
                    color: Colors.blue,
                    // Container is used to make the button have custom width and height
                    child: Container(
                      height: 120,
                      width: 120,
                      // Center is used to make the child inside it is centered in Container
                      child: Center(
                        child: Text(
                          "Stateful",
                          style: Theme.of(context).textTheme.button,
                        ),
                      ),
                    ),
                    onPressed: () =>
                        _navigateToScreen(StatefulScreen.routeName),
                  ),
                ],
              ),
              // Sized Box is used to create some space (in this case, vertical space with height of 20)
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  RaisedButton(
                    color: Colors.orange,
                    // Container is used to make the button have custom width and height
                    child: Container(
                      height: 120,
                      width: 120,
                      // Center is used to make the child inside it is centered in Container
                      child: Center(
                        child: Text(
                          "Provider.of",
                          style: Theme.of(context).textTheme.button,
                        ),
                      ),
                    ),
                    onPressed: () {},
                  ),
                  RaisedButton(
                    color: Colors.purple,
                    // Container is used to make the button have custom width and height
                    child: Container(
                      height: 120,
                      width: 120,
                      // Center is used to make the child inside it is centered in Container
                      child: Center(
                        child: Text(
                          "Consumer",
                          style: Theme.of(context).textTheme.button,
                        ),
                      ),
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
