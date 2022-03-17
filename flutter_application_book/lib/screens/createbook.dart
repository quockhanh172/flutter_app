// ignore_for_file: camel_case_types, prefer_const_constructors, prefer_final_fields, unused_field, avoid_types_as_parameter_names, unused_element

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
  Future<List<Category>>? futureCategories;
  String? selectedName;
  @override
  void initState() {
    super.initState();
    futureCategories = getCategories();
  }

  Widget _category(List<Category> cates) {
    return DropdownButton<String>(
      value: selectedName,
      hint: Text("Select Category"),
      items: cates.map((item) {
        return DropdownMenuItem(
          value: item.id.toString(),
          child: Text(item.nameCategory),
        );
      }).toList(),
      onChanged: (value) {
        setState(() {
          selectedName = value!;
        });
      },
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
      body: Column(
        children:<Widget> [  
          Container(
            margin: EdgeInsets.all(24),
            child: listFetchCategory(),
          ),
        ],
      ),
    );
  }

  FutureBuilder<List<Category>> listFetchCategory() {
    return FutureBuilder<List<Category>>(
        future: futureCategories,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Category>? categories = snapshot.data;
            return _category(categories!);
          } else {
            return Center(child: CircularProgressIndicator());
          }
        });
  }
}
