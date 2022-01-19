/*import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Addphone extends StatefulWidget {
  const Addphone({Key? key}) : super(key: key);

  @override
  _AddphoneState createState() => _AddphoneState();
}

class _AddphoneState extends State<Addphone> {
  var name = " ";
  var price = 0;

  @override
  Widget build(BuildContext context) {
    CollectionReference mobiles = Firestore.instance.collection('mobiles');
    return Scaffold(
      appBar: AppBar(
        title: Text("add phone"),
      ),
      body: ListView(
        children: <Widget>[
          Center(
              child: Container(
            height: 300,
            child: Column(
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(icon: Icon(Icons.person)),
                  onChanged: (value) {
                    name = value;
                  },
                ),
                TextField(
                  decoration: InputDecoration(icon: Icon(Icons.person)),
                  onChanged: (value) {
                    price = int.parse(value);
                  },
                ),
                RaisedButton(
                    child: Text("submit"),
                    onPressed: () {
                      mobiles
                          .add({'name': name, 'price': price})
                          .then((value) => print('mobile added'))
                          .catchError((error) => print("failed to add $error"));
                    })
              ],
            ),
          ))
        ],
      ),
    );
  }
}
*/