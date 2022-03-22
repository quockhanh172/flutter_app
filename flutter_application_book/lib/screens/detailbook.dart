// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_book/models/book.dart';
import 'package:flutter_application_book/screens/listbook.dart';
import 'package:intl/intl.dart';

class DetailBook extends StatefulWidget {
  final Book? book;
  const DetailBook({Key? key, this.book}) : super(key: key);

  @override
  State<DetailBook> createState() => _DetailBookState();
}

class _DetailBookState extends State<DetailBook> {
  final DateFormat _dateTimeFormat = DateFormat('dd-MM-yyyy');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 81, 228, 93),
          centerTitle: true,
          title: Text("Detail Book"),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            color: Colors.white,
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ListBook()),
            ),
          )),
      body: Card(
        child: Padding(
          padding: EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Column(
                  children: <Widget>[
                    Image.network(
                        "http://10.0.2.2:8080/ebook/${widget.book!.image}",
                        height: 200,
                        width: 170,
                        fit: BoxFit.cover),
                  ],
                ),
                Container(
                  width:MediaQuery.of(context).size.width*0.4,
                  margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 30),
                          child: Text(
                            "Title: ${widget.book!.title}",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            ),
                          ),
                        ),
                        Text(
                          "Author: ${widget.book!.author}",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          "Date: ${_dateTimeFormat.format(widget.book!.date)}",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          "Category: ${widget.book!.categoryName}",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ]),
                ),
              ]),
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(0,20, 0, 10),
                    child: Text("Description: ",style: (TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),)),
                  Container(
                    padding: const EdgeInsets.all(1.0),
                    width:MediaQuery.of(context).size.width*1,
                    child: Text("${widget.book!.description}")),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
