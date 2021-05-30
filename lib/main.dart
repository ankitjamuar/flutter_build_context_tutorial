import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context1) {
    print(context1.findRenderObject());
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Build Context"),
        ),
        body: Center(
          child: Container()
        ),
        floatingActionButton: Builder(
          builder: (context2) =>  Builder(
            builder: (context3)  {
              print(context1.findRenderObject());
              return FloatingActionButton(
              onPressed: (){
                Scaffold.of(context2).showSnackBar(
                    new SnackBar(content: Text("MeshCookie"))
                );
              },
              tooltip: 'Increment',
              child: Icon(Icons.add),
            );},
          ),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}