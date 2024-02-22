import 'package:digitstitch_app/features/digitstitch/domain/entities/category_entity.dart';

class CategoryModel extends CategoryEntity{
  const CategoryModel({
    int ? id,
    String ? title,
    String ? description,
    String ? image,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> map){
    return CategoryModel(
      id: map['id'] ?? 0,
      title: map['title'] ?? "",
      description: map['description'] ?? "",
      image: map['image'] ?? "",
    );
  }
}