// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';

import '../components/navigation.dart';

class HomeScreen extends StatelessWidget {
  static String routerName = "/";

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawerWidget(),
      appBar: AppBar(
        title: Text("Home"),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 81, 228, 93),
      ),
    );
  }
}
