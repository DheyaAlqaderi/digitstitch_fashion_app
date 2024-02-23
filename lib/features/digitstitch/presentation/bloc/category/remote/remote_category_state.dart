
import 'package:equatable/equatable.dart';
import 'package:dio/dio.dart';
import '../../../../domain/entities/category_entity.dart';

abstract class RemoteCategoryState extends Equatable{
  final List<CategoryEntity> ? category;
  final DioError ? error;

  const RemoteCategoryState({this.category, this.error});

  @override
  List<Object> get props => [category!, error!];
}

class RemoteCategoryLoading extends RemoteCategoryState{
  const RemoteCategoryLoading();
}

class RemoteCategoryDone extends RemoteCategoryState{
  const RemoteCategoryDone(List<CategoryEntity> category) : super(category: category);
}

class RemoteCategoryError extends RemoteCategoryState{
  const RemoteCategoryError(DioError error) : super(error: error);
}