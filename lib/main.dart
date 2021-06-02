import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context1) {
    return MaterialApp(
      title: 'BuildContext Demo',
      home: Scaffold(
        body: Center(
          child: Builder(
            builder: (context2) => Builder(
              builder: (context3) => ElevatedButton(
                  onPressed: () {
                    Scaffold.of(context3).showSnackBar(
                        new SnackBar(content: Text("MeshCookie")));
                  },
                  child: Text("Open Snackbar")),
            ),
          ),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
