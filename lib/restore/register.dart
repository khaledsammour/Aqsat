/*import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  late String _email, _password, _name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('register'),
      ),
      body: Column(
        children: [
          TextField(
            decoration: InputDecoration(hintText: 'email'),
            onChanged: (value) {
              this._email = value;
            },
          ),
          TextField(
            decoration: InputDecoration(hintText: 'name'),
            onChanged: (value) {
              this._name = value;
            },
          ),
          TextField(
            decoration: InputDecoration(hintText: 'password'),
            onChanged: (value) {
              this._password = value;
            },
          ),
          SizedBox(
            height: 20,
          ),
          RaisedButton(
              child: Text('Register'),
              onPressed: () async {
                try {
                  UserCredential userCredential = await FirebaseAuth.instance
                      .createUserWithEmailAndPassword(
                          email: _email, password: _password);
                } on FirebaseAuthException catch (e) {
                  if (e.code == 'weak-password') {
                    print('The password provided is too weak.');
                  } else if (e.code == 'email-already-in-use') {
                    print('The account already exists for that email.');
                  }
                } catch (e) {
                  print(e);
                }
              })
        ],
      ),
    );
  }
}*/
