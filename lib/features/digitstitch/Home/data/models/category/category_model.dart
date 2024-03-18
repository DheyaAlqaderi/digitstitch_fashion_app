class CategoryModel {
  int id;
  String? name;
  String? image;
  int products_count;
  String? image_fullpath;
  String? banner_image_fullpath;

  CategoryModel({
    required this.id,
    required this.name,
    required this.image,
    required this.products_count,
    required this.image_fullpath,
    required this.banner_image_fullpath,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      products_count: json['products_count'],
      image_fullpath: json['image_fullpath'],
      banner_image_fullpath: json['banner_image_fullpath'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'products_count': products_count,
      'image_fullpath': image_fullpath,
      'banner_image_fullpath': banner_image_fullpath,
    };
  }
}
