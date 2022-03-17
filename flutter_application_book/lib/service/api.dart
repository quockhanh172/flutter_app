import 'package:flutter_application_book/models/category.dart';
import 'package:http/http.dart' as http;

String baseUrl = "http://localhost:8080";
Future<List<Category>> getCategories() async {
  final response =
      await http.get(Uri.parse("http://localhost:8080/category/list"));
  return categoryFromJson(response.body);
}
