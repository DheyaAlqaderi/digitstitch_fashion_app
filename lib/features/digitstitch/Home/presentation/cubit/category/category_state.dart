import 'package:digitstitch_app/features/digitstitch/Home/data/models/category/category_model.dart';

abstract class CategoryState {}

class InitCategoryState extends CategoryState {}

class LoadingCategoryState extends CategoryState {}

class SuccessCategoryState extends CategoryState {
  List<CategoryModel> categoryModel;
  SuccessCategoryState(this.categoryModel);
}

class ErrorCategoryState extends CategoryState {
  String error;
  ErrorCategoryState(this.error);
}