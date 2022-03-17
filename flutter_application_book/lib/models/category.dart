import 'dart:convert';

import 'package:flutter_application_book/models/book.dart';

class Category {
  Category({required this.id, required this.nameCategory, required this.books});

  int id;
  String nameCategory;
  List<Book> books;

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json["id"],
      nameCategory: json["nameCategory"],
      books: json["ebooks"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "nameCategory": nameCategory,
      "ebooks": books,
    };
  }

  @override
  String toString() {
    return 'Category{id:$id, nameCategory:$nameCategory,ebooks:$books}';
  }
}

List<Category> categoryFromJson(String strJson) {
  final str = json.decode(strJson);
  return List<Category>.from(str.map((item) {
    return Category.fromJson(item);
  }));
}

String CategoryToJson(Category data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}
