import 'package:flutter/material.dart';

class Forms extends StatefulWidget {
  Forms({Key key}) : super(key: key);

  @override
  _FormsState createState() => _FormsState();
}

class _FormsState extends State<Forms> {
  String name, lastname, alumnid, calification;
  
  getName(name){
    this.name = name;
  }
  getLastName(lastame){
    this.lastname = lastname;
  }
  getAlumnID(alumnid){
    this.alumnid = alumnid;
  }
  getCalification(calification){
    this.calification = calification;
  }


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        children: <Widget>[
          TextFormField(
            decoration: (InputDecoration(
                labelText: "Name",
                fillColor: Colors.white,
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                  color: Colors.blueGrey,
                  width: 3,
                )))),
            onChanged: (String name) {
              getName(name);
            },
          ),
          TextFormField(
              decoration: (InputDecoration(
                  labelText: "Last Name",
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                    color: Colors.blueGrey,
                    width: 3,
                  )))),
              onChanged: (String lastname) {
                getLastName(lastname);
              },
          ),
          TextFormField(
              decoration: (InputDecoration(
                  labelText: "Alumn ID",
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                    color: Colors.blueGrey,
                    width: 3,
                  )))),
              onChanged: (String alumnid) {
                getAlumnID(alumnid);
              },
          ),
          TextFormField(
              decoration: (
                InputDecoration(
                  labelText: "Calification",
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blueGrey,
                      width: 3,
                    )
                  )
                )
              ),
              onChanged: (String calification) {
                getCalification(calification);
              },
          ),
        ],
      ),
    );
  }
}
