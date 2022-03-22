// ignore_for_file: unnecessary_new, deprecated_member_use

import 'dart:io';
import 'package:async/async.dart';
import 'package:flutter_application_book/models/book.dart';
import 'package:path/path.dart';
import 'package:flutter_application_book/models/category.dart';
import 'package:http/http.dart' as http;

String baseUrl = "http://localhost:8080";
String postUrl = "http://10.0.2.2:8080/ebook/add";
Future<List<Category>> getCategories() async {
  var response =
      await http.get(Uri.parse("http://10.0.2.2:8080/category/list"));
  return categoryFromJson(response.body);
}

Future <List<Book>> getBooks() async{
  var response = 
      await http.get(Uri.parse("http://10.0.2.2:8080/ebook/list"));
  return booksFromJson(response.body);
}

Future<bool> deleteBook(int id) async{
  var request = new http.Request('DELETE', Uri.parse("http://10.0.2.2:8080/ebook/delete/${id}"));
  var response = await request.send();
  if(response.statusCode==200){
    return true;
  }
  else{
    return false;
  }
}

Future<Book> upload(File imageFile, Map<String, String> body) async {
  // open a bytestream
  var stream =
      new http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
  Map<String, String> headers = {
    'Content-Type': 'multipart/form-data',
  };
  // get file length
  var length = await imageFile.length();

  // string to uri
  var uri = Uri.parse(postUrl);

  // create multipart request
  var request = new http.MultipartRequest('POST', uri)
    ..fields.addAll(body)
    ..headers.addAll(headers)
    ..files.add(await http.MultipartFile('image', stream, length,filename: basename(imageFile.path)));
  // multipart 

  // add file to multipart
  var response = await request.send();
  final respStr = await response.stream.bytesToString();
  if (response.statusCode == 201) {
    return bookFromJson(respStr);
  } else {
    return  bookFromJson(respStr);
  }
}
