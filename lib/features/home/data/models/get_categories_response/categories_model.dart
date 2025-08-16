class CategoriesModel {
  String id;
  String name;
  String slug;
  String image;
  DateTime createdAt;
  DateTime updatedAt;

  CategoriesModel({
    required this.id,
    required this.name,
    required this.slug,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
  });

  factory CategoriesModel.fromJson(Map<String, dynamic> json) =>
      CategoriesModel(
        id: json['_id'] as String,
        name: json['name'] as String,
        slug: json['slug'] as String,
        image: json['image'] as String,
        createdAt: DateTime.parse(json['createdAt'] as String),
        updatedAt: DateTime.parse(json['updatedAt'] as String),
      );
}
