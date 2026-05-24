

class CategoryModel {
  final int id;
  final String name;
  final String images;

  CategoryModel({required this.id, required this.name, required this.images});

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      images: json['image_url'] ?? '',
     
    );
  }
}
