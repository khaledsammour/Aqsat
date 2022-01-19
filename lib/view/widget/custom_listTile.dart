import 'package:flutter/material.dart';

import 'custom_text.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    Key? key,
    required this.title,
    required this.icon,
    required this.onpressed,
    this.trailing = true,
  }) : super(key: key);
  final String title;
  final Icon icon;
  final VoidCallback onpressed;
  final bool trailing;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FlatButton(
        onPressed: onpressed,
        child: ListTile(
            title: CustomText(
              title: title,
              fontSize: 18,
            ),
            leading: icon,
            trailing: trailing
                ? Icon(
                    Icons.navigate_next,
                    color: Colors.black,
                  )
                : Container(
                    height: 1,
                    width: 1,
                  )),
      ),
    );
  }
}
