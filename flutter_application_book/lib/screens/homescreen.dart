// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_application_book/screens/listbook.dart';

import '../components/navigation.dart';

class HomeScreen extends StatelessWidget {
  static String routerName = "/";

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawerWidget(),
      appBar: AppBar(
        title: Text("Admin"),

        actions: [
          IconButton(
              onPressed: () => 
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  ListBook()),
                  ),
              icon: Icon(Icons.list),
              padding: EdgeInsets.fromLTRB(0, 0, 40, 0)),
        ],
      ),
    );
  }
}
