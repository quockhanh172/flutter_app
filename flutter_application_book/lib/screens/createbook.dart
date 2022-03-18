// ignore_for_file: camel_case_types, prefer_const_constructors, prefer_final_fields, unused_field, avoid_types_as_parameter_names, unused_element, unnecessary_new, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_application_book/models/category.dart';
import 'package:flutter_application_book/service/api.dart';

import '../components/formCreateBook/formCreateBook.dart';
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
  final _formKey = GlobalKey<FormState>();
  DateTime? _dateTime;
  @override
  void initState() {
    super.initState();
    futureCategories = getCategories();
  }

  Widget _category(List<Category> cates) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.green.shade200,
      ),
      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
      margin: EdgeInsets.fromLTRB(100, 10, 0, 0),
      child: DropdownButton<String>(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        dropdownColor: Colors.green.shade50,
        focusColor: Colors.red,
        value: selectedName,
        hint: Text(
          "Select Category",
          style: TextStyle(fontSize: 18),
        ),
        items: cates.map((item) {
          return DropdownMenuItem(
              value: item.id.toString(),
              child: Text(
                item.nameCategory,
                style: TextStyle(fontSize: 18),
              ));
        }).toList(),
        icon: Icon(Icons.arrow_drop_down),
        iconSize: 42,
        underline: SizedBox(),
        onChanged: (value) {
          setState(() {
            selectedName = value!;
          });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarCreateBook(context),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(color: Colors.grey.shade300,
              // ignore: prefer_const_literals_to_create_immutables
              boxShadow: [
                BoxShadow(
                    blurRadius: 4,
                    color: Colors.grey.shade500,
                    offset: Offset(4, 8))
              ]),
          alignment: Alignment.center,
          margin: EdgeInsets.all(20),
          child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  textFormFieldTitle(),
                  textFormFieldAuthor(),
                  textFormFieldDescription(),
                  TextFormField(
                    decoration:
                        InputDecoration.collapsed(hintText: 'Pick a date'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Date of book';
                      } else {
                        return null;
                      }
                    },
                  ),
                  RaisedButton(
                    child: Text("pick a date"),
                    onPressed: () {
                      showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2022),
                        lastDate: DateTime(2025),
                      ).then((date) {
                        setState(() {
                          _dateTime = date;
                        });
                      });
                    },
                  ),
                  listFetchCategory(),
                ],
              )),
        ),
      ),
    );
  }

//text Form field Title

//Appbar
  AppBar appBarCreateBook(BuildContext context) {
    return AppBar(
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
        ));
  }

//fetch List Category
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
