/*import 'package:flutter/material.dart';

import 'home.dart';

class Cat extends StatelessWidget {
  const Cat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffd6d6d6),
      appBar: AppBar(
        elevation: 5,
        backgroundColor: Colors.white,
        title: Text(
          "brands",
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
      body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          itemBuilder: (BuildContext context, int index) {
            return Card(
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                                'assets/images/knowledge_graph_logo.png'))),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Text(
                      "Apple",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                ],
              ),
            );
          }),
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
            IconButton(
                onPressed: () {
                  Navigator.popAndPushNamed(context, 'search');
                },
                icon: Icon(Icons.search)),
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
            IconButton(onPressed: () {}, icon: Icon(Icons.menu_book_outlined)),
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: IconButton(
                  onPressed: () {
                    Navigator.popAndPushNamed(context, 'login');
                  },
                  icon: Icon(Icons.person)),
            ),
          ],
        ),
      ),
    );
  }
}*/
