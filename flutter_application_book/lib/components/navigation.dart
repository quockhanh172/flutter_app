// ignore_for_file: prefer_const_constructors, prefer_const_declarations, unused_local_variable

import 'package:flutter/material.dart';

import '../screens/listbook.dart';

class NavigationDrawerWidget extends StatelessWidget {
  const NavigationDrawerWidget({ Key? key }) : super(key: key);
  static var routerName = "/listbook";
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.red,
        child: ListView(
          children: <Widget>[
            const SizedBox(height: 48,),
            ListTile(
              leading: Icon(Icons.people,color: Colors.white),
              title: Text("List book",style: TextStyle(color: Colors.white70)),
              onTap: ()=> Navigator.push(context,
                    MaterialPageRoute(builder: (context) =>  ListBook()),
                  ),
            )],
        ),
      ),
    );
  }

}
