import 'dart:convert';

class Book {
  Book({
    required this.id,
    required this.title,
    required this.description,
    required this.date,
    required this.author,
    required this.image,
    required this.categoryName,
    required this.categoryId,
  });

  int id;
  String title;
  String description;
  DateTime date;
  String author;
  String image;
  String categoryName;
  int categoryId;

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        date: json["date"],
        author: json["author"],
        image: json["image"],
        categoryName: json["categoryName"],
        categoryId: json["categoryId"]);
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "description": description,
      "categoryName": categoryName,
      "date": date,
      "image": image,
      "author": author,
      "catgoryId": categoryId
    };
  }

  @override
  String toString() {
    return 'Book{id: $id, title: $title, description: $description, date: $date, author: $author, image: $image, categoryName: $categoryName, categoryId:$categoryId}';
  }
}

List<Book> bookFromJson(String strJson) {
  final str = json.decode(strJson);
  return List<Book>.from(str.map((item) {
    return Book.fromJson(item);
  }));
}

String bookToJson(Book data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}
