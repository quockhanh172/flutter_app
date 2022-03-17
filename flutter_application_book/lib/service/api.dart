import 'package:flutter_application_book/models/category.dart';
import 'package:http/http.dart' as http;

String baseUrl = "http://localhost:8080";
Future<List<Category>> getCategories() async {
  var response = await http.get(Uri.parse("http://10.0.2.2:8080/category/list"));
  return categoryFromJson(response.body);
}
