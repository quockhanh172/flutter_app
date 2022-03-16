import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter_application_book/models/book.dart';
import 'package:http/http.dart' as http;

class Category{
  Category({this.id,
           this.nameCategory,
           this.books
           });

  int ?id;
  String ?nameCategory;
  late List<Book> ?books;

  Category.fromJson(Map<String,dynamic> json){
    id=json["id"];
    nameCategory= json["name"];
    books= json["ebooks"];
  }

  Map<String,dynamic> toJson(){
    final Map<String,dynamic> data = new Map<String,dynamic>();
    data["id"]= this.id;
    data["name"]=this.nameCategory;
    data["ebooks"]= this.books;
    return data;
  }
}

Future<List<Category>> fetchAndSetCategory() async{
   Uri url = Uri.parse('http://localhost:8080/category/list');
   final response= await http.get(url);
   var list = json.decode(response.body) as List<dynamic>;
   List<Category> categories = list.map((model) => Category.fromJson(model)).toList();
   if(response.statusCode==200){
      return categories;
   }
   else{
     return throw Exception("not found");
   }
}

