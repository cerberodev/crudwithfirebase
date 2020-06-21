import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Forms extends StatefulWidget {
  Forms({Key key}) : super(key: key);

  @override
  _FormsState createState() => _FormsState();
}

class _FormsState extends State<Forms> {
  final _claveFormulario = GlobalKey<FormState>();

  String userName, userLastname, userID, userCalification;

  void getUserName(name) {
    this.userName = name;
  }

  void getUserLastName(lastname) {
    this.userLastname = lastname;
  }

  void getUserID(id) {
    this.userID = id;
  }

  void getUserCalification(calification) {
    this.userCalification = calification;
  }

  createUser() {
    DocumentReference documentReference =
        Firestore.instance.collection("DATA").document(userName);
    Map<String, dynamic> users = {
      "userName": userName,
      "userLastName": userLastname,
      "userID": userID,
      "userCalification": userCalification,
    };

    documentReference.setData(users).whenComplete(() {
      print("$userName $userLastname created");
    });
  }

  readUser() {
    DocumentReference documentReference =
        Firestore.instance.collection("DATA").document(userName);

    documentReference.get().then((datasnapshot) {
      print(datasnapshot.data["userName"]);
      print(datasnapshot.data["userLastName"]);
      print(datasnapshot.data["userID"]);
      print(datasnapshot.data["userCalification"]);
    });
  }

  updateUser() {
    DocumentReference documentReference =
        Firestore.instance.collection("DATA").document(userName);
    Map<String, dynamic> users = {
      "userName": userName,
      "userLastName": userLastname,
      "userID": userID,
      "userCalification": userCalification,
    };

    documentReference.setData(users).whenComplete(() {
      print("$userName $userLastname updated");
    });
  }

  deleteUser() {
    DocumentReference documentReference =
        Firestore.instance.collection("DATA").document(userName);

    documentReference.delete().whenComplete(() {
      print("$userName $userLastname deleted");
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Center(
          child: Form(
            key: _claveFormulario,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                FlutterLogo(size: 150),
                TextFormField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Escribe el nombre';
                    }
                    return null;
                  },
                  decoration: (InputDecoration(
                      labelText: "Name",
                      fillColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                        color: Colors.blueGrey,
                        width: 3,
                      )))),
                  onChanged: (String name) {
                    getUserName(name);
                  },
                ),
                TextFormField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Escribe el apellido';
                    }
                    return null;
                  },
                  decoration: (InputDecoration(
                      labelText: "Last Name",
                      fillColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                        color: Colors.blueGrey,
                        width: 3,
                      )))),
                  onChanged: (String lastname) {
                    getUserLastName(lastname);
                  },
                ),
                TextFormField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Escribe el User ID';
                    }
                    return null;
                  },
                  decoration: (InputDecoration(
                      labelText: "User ID",
                      fillColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                        color: Colors.blueGrey,
                        width: 3,
                      )))),
                  onChanged: (String id) {
                    getUserID(id);
                  },
                ),
                TextFormField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Ingresa la Calificacion';
                    }
                    return null;
                  },
                  decoration: (InputDecoration(
                      labelText: "Calification",
                      fillColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                        color: Colors.blueGrey,
                        width: 3,
                      )))),
                  onChanged: (String calification) {
                    getUserCalification(calification);
                  },
                ),
                SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    RaisedButton(
                      onPressed: ()async{
                        if (!_claveFormulario.currentState.validate()) {
                          return;
                        } createUser();
                      },
                      child: Icon(Icons.add, color: Colors.green),
                    ),
                    RaisedButton(
                      onPressed: () async {
                        if (!_claveFormulario.currentState.validate()) {
                          return;
                        } readUser();
                      },
                      child: Icon(Icons.book, color: Colors.yellow),
                    ),
                    RaisedButton(
                      onPressed: () async {
                        if (!_claveFormulario.currentState.validate()) {
                          return;
                        } updateUser();
                      },
                      child: Icon(Icons.edit, color: Colors.blue),
                    ),
                    RaisedButton(
                      onPressed: () async {
                        if (!_claveFormulario.currentState.validate()) {
                          return;
                        } deleteUser();
                      },
                      child: Icon(Icons.delete, color: Colors.red),
                    ),
                  ],
                ),
                StreamBuilder(
                    stream: Firestore.instance.collection("DATA").snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                            shrinkWrap: true,
                            itemCount: snapshot.data.documents.length,
                            itemBuilder: (context, index) {
                              DocumentSnapshot documentSnapshot =
                                  snapshot.data.documents[index];
                              return ListTile(
                                title: Row(
                                  children: <Widget>[
                                    Text(documentSnapshot["userName"]),
                                    Text(documentSnapshot["userLastName"]),
                                  ],
                                ),
                                subtitle: Text(documentSnapshot["userID"]),
                                leading: Icon(Icons.android),
                                trailing:
                                    Text(documentSnapshot["userCalification"]),
                              );
                            });
                      } else {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
