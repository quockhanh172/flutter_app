// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_book/models/book.dart';
import 'package:flutter_application_book/screens/createbook.dart';
import 'package:flutter_application_book/screens/detailbook.dart';
import 'package:flutter_application_book/screens/homescreen.dart';
import 'package:flutter_application_book/service/api.dart';

class ListBook extends StatefulWidget {
  static String routerName = "/listbook";

  const ListBook({Key? key}) : super(key: key);

  @override
  State<ListBook> createState() => _ListBookState();
}

class _ListBookState extends State<ListBook> {
  Future<List<Book>>? futureBooks;
  @override
  void initState() {
    super.initState();
    futureBooks = getBooks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 81, 228, 93),
          centerTitle: true,
          title: Text("List book"),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            color: Colors.white,
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            ),
          )),
      body: FutureBuilder<List<Book>>(
        future: futureBooks,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Book>? books = snapshot.data;
            return ListView.builder(
              itemCount: books!.length,
              itemBuilder: (BuildContext context, index) {
                return Card(
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailBook(
                                    book: books[index],
                                  )));
                    },
                    child: Padding(
                      padding: EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListTile(
                            leading: (Icon(Icons.book)),
                            title: Text("Title book: " + books[index].title),
                            subtitle: Text("Author: " + books[index].author),
                            isThreeLine: true,
                          ),
                          Text(
                            "Category: " + books[index].categoryName,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          ButtonBar(
                            children: [
                              RaisedButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                child: Text("Edit"),
                                textColor: Colors.white,
                                color: Colors.yellow,
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => CreateBook(
                                                book: books[index],
                                              )));
                                },
                              ),
                              RaisedButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                child: Text("Delete"),
                                textColor: Colors.white,
                                color: Colors.red,
                                onPressed: () {
                                  showAlertDialog(context, books[index]);
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

showAlertDialog(BuildContext context, Book book) {
  // set up the buttons
  Widget cancelButton = TextButton(
    child: Text("Cancel"),
    onPressed: () {
      Navigator.pop(context);
    },
  );
  Widget continueButton = TextButton(
    child: Text("Ok"),
    onPressed: () {
      deleteBook(book.id).then((value) => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ListBook()),
          ));
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("AlertDialog"),
    content: Text("Are u sure delete book ${book.title} ?"),
    actions: [
      cancelButton,
      continueButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
