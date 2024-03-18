import 'package:digitstitch_app/features/digitstitch/Home/data/models/category/category_model.dart';

import '../../repository/home_page_repository.dart';

class GetCategoryUseCase{
  final HomePageRepository _homePageRepository;

  GetCategoryUseCase(this._homePageRepository);

  Future<List<CategoryModel>> getCategory() {
    return  _homePageRepository.getCategory();
  }

}