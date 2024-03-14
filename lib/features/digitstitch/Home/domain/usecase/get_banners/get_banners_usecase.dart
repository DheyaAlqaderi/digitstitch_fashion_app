import 'package:digitstitch_app/features/digitstitch/Home/data/models/banner/banner_response_model.dart';
import 'package:digitstitch_app/features/digitstitch/Home/domain/repository/home_page_repository.dart';

class GetBannersUseCase{
  final HomePageRepository _homePageRepository;

  GetBannersUseCase(this._homePageRepository);

  Future<List<BannerResponseModel>> getBanners() {
    return  _homePageRepository.getBanners();
  }

}