// ignore_for_file: camel_case_types, prefer_const_constructors, prefer_final_fields, unused_field

import 'package:flutter/material.dart';
import 'package:flutter_application_book/models/category.dart';

import 'homescreen.dart';

class CreateBook extends StatelessWidget {
  const CreateBook({ Key? key }) : super(key: key);
  static GlobalKey<FormState> _formKey= GlobalKey<FormState>();
  Widget? _buildTitle(){
    return null;
  }
    Widget? _description(){
    return null;
  }
    Widget? _date(){
    return null;
  }
    Widget? _author(){
    return null;
  }
    Widget? _image(){
    return null;
  }
    Widget _category(){
      return  DropdownButton<String>(
          items: <String>['A', 'B', 'C', 'D'].map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (_) {},
      );
  }
  @override
  Widget build(BuildContext context) { 
    return Scaffold(
      appBar: AppBar(
            backgroundColor: Color.fromARGB(255, 81, 228, 93),
            centerTitle: true,
            title:Text("Create Book"),
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              color: Colors.white,
              onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
              ),
            )
        ),
      body: Container(
        margin: EdgeInsets.all(24),
        child: _category(),
      ),  
    );
  }
}