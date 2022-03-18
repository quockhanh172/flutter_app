// ignore_for_file: prefer_const_constructors, unnecessary_new

import 'package:flutter/material.dart';

Container textFormFieldTitle() {
  return Container(
    margin: EdgeInsets.fromLTRB(5, 10, 5, 0),
    height: 45,
    alignment: Alignment.center,
    decoration: BoxDecoration(
      color: Colors.green.shade200,
      borderRadius: BorderRadius.circular(5),
    ),
    child: TextFormField(
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
      color: Colors.green.shade200,
      borderRadius: BorderRadius.circular(5),
    ),
    child: TextFormField(
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
      color: Colors.green.shade200,
      borderRadius: BorderRadius.circular(5),
    ),
    child: TextFormField(
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
