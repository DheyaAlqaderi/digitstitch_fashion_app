
import 'package:digitstitch_app/features/digitstitch/Home/data/models/banner/banner_response_model.dart';

abstract class HomePageRepository{

  // get banners from API
  Future<List<BannerResponseModel>> getBanners();
}
