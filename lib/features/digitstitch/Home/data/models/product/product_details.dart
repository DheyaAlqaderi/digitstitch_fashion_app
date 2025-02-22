
import 'package:digitstitch_app/features/digitstitch/Home/data/models/product/latest_product_model.dart';

class ProductDetailsModel{
  final Product? product;
  final List<Product>? relatedProducts;

  ProductDetailsModel({
    this.product,
    this.relatedProducts,
  });

  factory ProductDetailsModel.fromJson(Map<String, dynamic> json) {
    return ProductDetailsModel(
      product: json['product'] != null ? Product.fromJson(json['product']) : null,
      relatedProducts: json['related_products'] != null
          ? (json['related_products'] as List).map((e) => Product.fromJson(e)).toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'product': product?.toJson(),
      'related_products': relatedProducts?.map((product) => product.toJson()).toList(),
    };
  }
}