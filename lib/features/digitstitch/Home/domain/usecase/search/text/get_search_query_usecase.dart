
import '../../../../data/models/product/product_model.dart';
import '../../../repository/home_page_repository.dart';

class GetSearchQueryUseCase{
  final HomePageRepository _homePageRepository;

  GetSearchQueryUseCase(this._homePageRepository);

  Future<ProductModel> getSearchQuery(String query, int offset) {
    return  _homePageRepository.getSearchQuery(limit: 50, offset: offset, query: query);
  }
}