// ignore_for_file: camel_case_types, prefer_const_constructors, prefer_final_fields, unused_field, avoid_types_as_parameter_names, unused_element, unnecessary_new, deprecated_member_use, unnecessary_null_comparison
import 'dart:io';

import 'package:flutter_application_book/screens/listbook.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_book/models/category.dart';
import 'package:flutter_application_book/service/api.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'homescreen.dart';

class CreateBook extends StatefulWidget {
  const CreateBook({Key? key,}) : super(key: key);
  static GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  State<CreateBook> createState() => _CreateBookState();
}

class _CreateBookState extends State<CreateBook> {
  Future<List<Category>>? futureCategories;
  String? selectedName;
  final _formKey = GlobalKey<FormState>();
  DateTime? _dateTime;
  final DateFormat _dateTimeFormat = DateFormat('dd-MM-yyyy');

  File? _image;
  final _picker = ImagePicker();
  bool showspinner = false;

  //controller editting text field
  final TextEditingController titleInput = TextEditingController();
  final TextEditingController dateInput = TextEditingController();
  final TextEditingController descriptionInput = TextEditingController();
  final TextEditingController authorInput = TextEditingController();

  @override
  void initState() {
    super.initState();
    futureCategories = getCategories();
    dateInput.text = "";
  }
  Widget _category(List<Category> cates) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey.shade400,
      ),
      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
      margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
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
                style: TextStyle(fontSize: 20),
              ));
        }).toList(),
        icon: Icon(Icons.arrow_drop_down),
        iconSize: 30,
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
                textDisplayDatePicked(),
                buttonDatePicker(context),
                pickPictureFromGallery(),
                listFetchCategory(),
                ElevatedButton(
                  onPressed: () {
                    // Validate returns true if the form is valid, or false otherwise.
                    if (_formKey.currentState!.validate()&& _image!=null && selectedName!=null) {
                      Map<String, String> data = {
                        'title': titleInput.text,
                        'author': authorInput.text,
                        'date': dateInput.text,
                        'description': descriptionInput.text,
                        'categoryId': selectedName.toString(),
                      };
                      upload(_image!, data) == null
                          ? ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('failled')),
                            )
                          : ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('successfull')),
                            );
                    }
                    else{
                       ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Please choose image of book and category')),
                    );
                    }
                  },
                  child: const Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  ModalProgressHUD pickPictureFromGallery() {
    return ModalProgressHUD(
      inAsyncCall: showspinner,
      child: GestureDetector(
        onTap: () {
          getImage();
        },
        child: Container(
          margin: EdgeInsets.fromLTRB(130, 10, 130, 0),
          height: 100,
          width: 100,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Colors.grey.shade400,
              borderRadius: BorderRadius.circular(5),
              border: Border.all(style: BorderStyle.solid)),
          child: _image == null
              ? Center(
                  child: Text("pick a Image"),
                )
              : Container(
                  child: Center(
                      child: Image.file(
                    File(_image!.path).absolute,
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                  )),
                ),
        ),
      ),
    );
  }

  Container textFormFieldTitle() {
    return Container(
      margin: EdgeInsets.fromLTRB(5, 10, 5, 0),
      height: 45,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border(
            bottom: BorderSide(
          color: Colors.black,
        )),
      ),
      child: TextFormField(
        controller: titleInput,
        decoration: InputDecoration.collapsed(hintText: 'Title of book'),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter Title of book';
          } else {
            return null;
          }
        },
      ),
    );
  }

  Container textFormFieldAuthor() {
    return Container(
      margin: EdgeInsets.fromLTRB(5, 10, 5, 0),
      height: 45,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border(
            bottom: BorderSide(
          color: Colors.black,
        )),
      ),
      child: TextFormField(
        controller: authorInput,
        decoration: new InputDecoration.collapsed(hintText: 'Author of book'),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter Title of book';
          } else {
            return null;
          }
        },
      ),
    );
  }

  Container textFormFieldDescription() {
    return Container(
      margin: EdgeInsets.fromLTRB(5, 10, 5, 0),
      height: 150,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border(
            bottom: BorderSide(
          color: Colors.black,
        )),
      ),
      child: TextFormField(
        controller: descriptionInput,
        minLines: 6,
        keyboardType: TextInputType.multiline,
        maxLines: null,
        decoration:
            new InputDecoration.collapsed(hintText: 'Description of book'),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter Title of book';
          } else {
            return null;
          }
        },
      ),
    );
  }

//putton pick a date
  Container buttonDatePicker(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(220, 0, 0, 0),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            blurRadius: 10, color: Colors.grey.shade500, offset: Offset(4, 8))
      ]),
      child: RaisedButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        color: Colors.grey.shade400,
        child: Text("pick a date"),
        onPressed: () {
          showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2010),
            lastDate: DateTime(2025),
          ).then((date) {
            setState(() {
              dateInput.text = _dateTimeFormat.format(date!);
            });
          });
        },
      ),
    );
  }

// text display date picked
  Container textDisplayDatePicked() {
    return Container(
      margin: EdgeInsets.fromLTRB(5, 10, 5, 0),
      height: 45,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border(
            bottom: BorderSide(
          color: Colors.black,
        )),
      ),
      child: TextFormField(
        controller: dateInput,
        readOnly: true,
        decoration: InputDecoration.collapsed(
            hintText: 'Choose date by button pick a date'),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter Date';
          } else {
            return null;
          }
        },
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
            MaterialPageRoute(builder: (context) => ListBook()),
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

//get image from gallery
  Future getImage() async {
    final pickedFile =
        await _picker.pickImage(source: ImageSource.gallery, imageQuality: 80);
    
    if (pickedFile != null) {
      _image = File(pickedFile.path);
      setState(() {});
    } else {
      print('no image selected');
    }
  }
}
