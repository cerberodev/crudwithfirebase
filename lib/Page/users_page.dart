//import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:flutter/material.dart';
//
//class UsersPage extends StatefulWidget {
//  UsersPage({Key key}) : super(key: key);
//
//  @override
//  _UsersPageState createState() => _UsersPageState();
//}
//
//class _UsersPageState extends State<UsersPage> {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//        appBar: AppBar(
//          title: Text('Users List'),
//        ),
//        body: StreamBuilder(
//            stream: Firestore.instance.collection("Users").snapshots(),
//            builder: (context, snapshot) {
//              if (snapshot.hasData) {
//                return ListView.builder(
//                    shrinkWrap: true,
//                    itemCount: snapshot.data.documents.length,
//                    itemBuilder: (context, index) {
//                      DocumentSnapshot documentSnapshot =
//                          snapshot.data.documents[index];
//                      return ListTile(
//                        title: Text(documentSnapshot["userName"]),
//                        subtitle: Text(documentSnapshot["userID"]),
//                        leading: Icon(Icons.android),
//                        trailing: Text(documentSnapshot["userCalification"]),
//                      );
//                    });
//              } else {
//                return Center(
//                  child: CircularProgressIndicator(),
//                );
//              }
//            })
//    );
//  }
//}
