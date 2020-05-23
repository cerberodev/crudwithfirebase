import 'package:crudwhitfirebase/Page/forms.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cerberodev - CRUD FIREBASE'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(child: Forms()),
      ),
    );
  }
}
