class Book {
  Book(
      {required this.id,
      required this.title,
      required this.description,
      required this.date,
      required this.author,
      required this.image,
      required this.nameCategory,
      required this.idCategory});

  int id;
  String title;
  String description;
  DateTime date;
  String author;
  String image;
  String nameCategory;
  int idCategory;

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        date: json["date"],
        author: json["author"],
        image: json["image"],
        nameCategory: json["nameCategory"],
        idCategory: json["idCategory"]);
  }
}
