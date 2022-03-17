// ignore_for_file: prefer_const_constructors, prefer_const_declarations, unused_local_variable
import 'package:flutter/material.dart';
import 'package:flutter_application_book/screens/createbook.dart';

import '../screens/listbook.dart';

class NavigationDrawerWidget extends StatelessWidget {
  const NavigationDrawerWidget({Key? key}) : super(key: key);
  static var padding = EdgeInsets.symmetric(horizontal: 20);
  static var routerName = "/listbook";
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: Color.fromARGB(255, 146, 207, 146),
        child: ListView(
          padding: padding,
          children: <Widget>[
            const SizedBox(
              height: 48,
            ),
            listTitleComponent(
                text: "List Book",
                icon: Icons.book,
                context: context,
                a: ListBook()),
            listTitleComponent(
                text: "Create book",
                icon: Icons.add,
                context: context,
                a: CreateBook()),
          ],
        ),
      ),
    );
  }
}

Widget listTitleComponent({
  required String text,
  required IconData icon,
  required BuildContext context,
  required StatefulWidget a,
}) {
  final color = Colors.white;
  final hovercolor = Colors.white70;

  return ListTile(
    leading: Icon(icon, color: color),
    title: Text(text, style: TextStyle(color: color)),
    hoverColor: hovercolor,
    onTap: () =>
        Navigator.push(context, MaterialPageRoute(builder: (context) => a)),
  );
}
