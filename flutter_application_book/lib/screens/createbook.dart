// ignore_for_file: camel_case_types, prefer_const_constructors, prefer_final_fields, unused_field, avoid_types_as_parameter_names

import 'package:flutter/material.dart';
import 'package:flutter_application_book/models/category.dart';
import 'package:flutter_application_book/service/api.dart';

import 'homescreen.dart';

class CreateBook extends StatefulWidget {
  const CreateBook({Key? key}) : super(key: key);
  static GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  State<CreateBook> createState() => _CreateBookState();
}

class _CreateBookState extends State<CreateBook> {
  Widget? _buildTitle() {
    return null;
  }

  Widget? _description() {
    return null;
  }

  Widget? _date() {
    return null;
  }

  Widget? _author() {
    return null;
  }

  Widget? _image() {
    return null;
  }

  late Future<List<Category>> futureCategories;
  @override
  void initState() {
    super.initState();
    futureCategories = getCategories();
  }

  Widget _category() {
    return DropdownButton<String>(
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
          title: Text("Create Book"),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            color: Colors.white,
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            ),
          )),
      body: Container(
        margin: EdgeInsets.all(24),
        child: FutureBuilder<List<Category>>(
            future: futureCategories,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Category>? categories = snapshot.data;
                return Column(
                    children: categories!
                        .map((Category) => Column(
                              children: <Widget>[
                                Text(Category.books.toString()),
                              ],
                            ))
                        .toList());
              } else {
                return Center(child: CircularProgressIndicator());
              }
            }),
      ),
    );
  }
}
