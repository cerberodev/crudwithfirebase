

import 'package:crudwhitfirebase/Page/floating_action_butons.dart';
import 'package:crudwhitfirebase/Page/forms.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cerberodev - CRUD FIREBASE'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          FlutterLogo(size: 200),
          Forms(),
          Buttons(),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}