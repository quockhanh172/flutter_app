import 'package:flutter_application_book/models/category.dart';

class Book{
  Book({required this.id,
        required this.title,
        required this.description,
        required this.date,
        required this.author,
        required this.image,
        required this.category
        });

  int id;
  String title;
  String description;
  DateTime date;
  String author;
  String image;
  Category category;
}