import 'package:equatable/equatable.dart';

class CategoryEntity extends Equatable{
  final int ? id;
  final String ? title;
  final String ? description;
  final String ? image;

  const CategoryEntity({
    this.id,
    this.title,
    this.description,
    this.image,
  });

  @override
  List < Object ? > get props {
    return [
      id,
      title,
      description,
      image,
    ];
  }
}