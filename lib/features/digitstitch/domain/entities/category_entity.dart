import 'package:digitstitch_app/features/digitstitch/domain/entities/rating_entity.dart';
import 'package:equatable/equatable.dart';

class CategoryEntity extends Equatable {
  final int? id;
  final String? title;
  final double? price;
  final String? description;
  final String? category;
  final String? image;

  const CategoryEntity({
    this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.image,
  });

  @override
  List<Object?> get props {
    return [
      id,
      title,
      price,
      description,
      category,
      image,
    ];
  }
}
