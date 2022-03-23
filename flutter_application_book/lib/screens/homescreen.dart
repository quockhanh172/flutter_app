// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_application_book/screens/detailbook.dart';

import '../components/navigation.dart';
import '../models/book.dart';
import '../service/api.dart';

class HomeScreen extends StatefulWidget {
  static String routerName = "/";

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<List<Book>>? futureBooks;
  @override
  void initState() {
    super.initState();
    futureBooks = getBooks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawerWidget(),
      appBar: AppBar(
        title: Text("Home"),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 81, 228, 93),
      ),
      body: FutureBuilder<List<Book>>(
        future: futureBooks,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Book>? books = snapshot.data;
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 0.6,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10),
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
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.network(
                                "http://10.0.2.2:8080/ebook/${books[index].image}",
                                height: 150,
                                width: 100,
                                fit: BoxFit.cover),
                          ListTile(
                            title: Text("Title: " + books[index].title),
                            subtitle: Text("Author: " + books[index].author),
                            isThreeLine: true,
                          ),
                          Text(
                            "Category: " + books[index].categoryName,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
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
