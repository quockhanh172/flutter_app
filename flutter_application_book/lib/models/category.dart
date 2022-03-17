import 'dart:convert';

class Category {
  Category({required this.id, required this.nameCategory});

  int id;
  String nameCategory;

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json["id"],
      nameCategory: json["nameCategory"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "nameCategory": nameCategory,
    };
  }

  @override
  String toString() {
    return 'Category{id:$id, nameCategory:$nameCategory}';
  }
}

List<Category> categoryFromJson(String strJson) {
  final str = json.decode(strJson);
  return List<Category>.from(str.map((item) {
    return Category.fromJson(item);
  }));
}

String categoryToJson(Category data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}
