/*import 'package:flutter/material.dart';

import 'package:material_floating_search_bar/material_floating_search_bar.dart';

class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: Builder(
              builder: (context) {
                return FloatingSearchBar(builder: (context, x) {
                  return buildBody();
                });
              },
            ),
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

  Widget buildBody() {
    final time = DateTime.now();
    print('BuildBody at ${time.second}:${time.millisecond}');
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Material(
        child: Column(
          children: List.generate(100, (index) => index.toString())
              .map((e) => ListTile(
                    title: Text(e),
                  ))
              .toList(),
        ),
      ),
    );
  }
}*/
