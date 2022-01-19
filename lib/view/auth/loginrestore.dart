import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late String _email, _password;
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffd6d6d6),
      appBar: AppBar(
        elevation: 5,
        backgroundColor: Colors.white,
        title: Text(
          "account",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.home,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            color: Colors.black,
          ),
          onPressed: () {},
        ),
      ),
      body: ListView(
        children: [
          Column(
            children: <Widget>[
              SizedBox(
                height: 60,
              ),
              Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(200),
                  color: Colors.red,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                    height: 60,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30)),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: TextField(
                        decoration: InputDecoration(hintText: "Email..."),
                        onChanged: (value) {
                          setState(() {
                            this._email = value;
                          });
                        },
                      ),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                    height: 60,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: TextField(
                        decoration: InputDecoration(hintText: "password..."),
                        onChanged: (value) {
                          setState(() {
                            this._password = value;
                          });
                        },
                      ),
                    )),
              ),
              SizedBox(
                height: 20,
              ),
              RaisedButton(
                  child: Text('login'),
                  onPressed: () async {
                    try {
                      UserCredential userCredential = await FirebaseAuth
                          .instance
                          .signInWithEmailAndPassword(
                              email: _email, password: _password);
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'user-not-found') {
                        print('No user found for that email.');
                      } else if (e.code == 'wrong-password') {
                        print('Wrong password provided for that user.');
                      }
                    }
                  }),
              FlatButton(
                onPressed: () {},
                child: Text('Register'),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 50,
        decoration: BoxDecoration(color: Colors.white),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: IconButton(
                  onPressed: () {
                    Navigator.popAndPushNamed(context, 'home');
                  },
                  icon: Icon(Icons.home)),
            ),
            IconButton(onPressed: () {}, icon: Icon(Icons.search)),
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50), color: Colors.red),
              child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.message,
                    color: Colors.white,
                  )),
            ),
            IconButton(
                onPressed: () {
                  Navigator.popAndPushNamed(context, 'cat');
                },
                icon: Icon(Icons.menu_book_outlined)),
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: IconButton(onPressed: () {}, icon: Icon(Icons.person)),
            ),
          ],
        ),
      ),
    );
  }
}
