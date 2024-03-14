class BannerResponseModel {
  final int id;
  final String title;
  final int? product_id;
  final int? category_id;
  final String banner_type;
  final String image_fullpath;

  BannerResponseModel({
    required this.id,
    required this.title,
    this.product_id,
    required this.category_id,
    required this.banner_type,
    required this.image_fullpath,
  });

  factory BannerResponseModel.fromJson(Map<String, dynamic> json) {
    return BannerResponseModel(
      id: json['id'],
      title: json['title'],
      product_id: json['product_id'],
      category_id: json['category_id'],
      banner_type: json['banner_type'],
      image_fullpath: json['image_fullpath'],
    );
  }
}
