// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_book/screens/homescreen.dart';

class ListBook extends StatelessWidget {
  static String routerName = "/listbook";

  const ListBook({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Color.fromARGB(255, 81, 228, 93),
            centerTitle: true,
            title:Text("List book"),
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              color: Colors.white,
              onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
              ),
            )
        )
      );
  }
}

