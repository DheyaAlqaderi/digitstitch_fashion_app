
import '../../../data/models/product/latest_product_model.dart';
import '../../repository/home_page_repository.dart';

class GetLatestProductUseCase{
  final HomePageRepository _homePageRepository;

  GetLatestProductUseCase(this._homePageRepository);

  Future<LatestProductModel> getLatestProducts(int limit) {
    return  _homePageRepository.getLatestProduct(limit);
  }
}