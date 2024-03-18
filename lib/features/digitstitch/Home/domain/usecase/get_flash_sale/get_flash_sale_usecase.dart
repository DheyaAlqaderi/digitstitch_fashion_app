
import 'package:digitstitch_app/features/digitstitch/Home/data/models/flash_sale/flash_sale_model.dart';

import '../../repository/home_page_repository.dart';

class GetFlashStateUseCase{
  final HomePageRepository _homePageRepository;

  GetFlashStateUseCase(this._homePageRepository);

  Future<FlashSaleModel> getFlashSales() {
    return  _homePageRepository.getFlashSaleProducts();
  }
}