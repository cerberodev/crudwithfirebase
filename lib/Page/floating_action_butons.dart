
import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {
  const Buttons({Key key}) : super(key: key);


  createUser(){
    print('User Created');
  }
  readUser(){
    print('User Reading');
  }
  updateUser(){
    print('User Updating');
  }
  deleteUser(){
    print('User Erraser');
  }


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          FloatingActionButton(
            onPressed: createUser,
            tooltip: 'CREATE',
            child: Icon(Icons.add, color: Colors.green),
          ),
          FloatingActionButton(
            onPressed: readUser,
            tooltip: 'READ',
            child: Icon(Icons.book, color: Colors.yellow),
          ),
          FloatingActionButton(
            onPressed: updateUser,
            tooltip: 'UPDATE',
            child: Icon(Icons.edit, color: Colors.blue),
          ),
          FloatingActionButton(
            onPressed: deleteUser,
            tooltip: 'DELETE',
            child: Icon(Icons.delete, color: Colors.red),
          ),
        ],
        );
  }
}