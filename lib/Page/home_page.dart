import 'package:crudwhitfirebase/Page/forms.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GDG AREQUIPA - CRUD FIREBASE'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(child: Forms()),
      ),
    );
  }
}
