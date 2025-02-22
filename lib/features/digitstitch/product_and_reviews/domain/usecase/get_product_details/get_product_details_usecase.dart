
import 'package:digitstitch_app/features/digitstitch/Home/data/models/product/product_details.dart';
import 'package:digitstitch_app/features/digitstitch/Home/domain/repository/home_page_repository.dart';

class GetProductDetailsUseCase{
  final HomePageRepository _homePageRepository;
  GetProductDetailsUseCase(this._homePageRepository);

  Future<ProductDetailsModel> getProductDetails(int productId) {
    return  _homePageRepository.getProductDetails(productId);
  }

}