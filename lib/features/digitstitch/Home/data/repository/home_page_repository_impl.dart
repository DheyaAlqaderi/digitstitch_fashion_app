
import 'package:digitstitch_app/features/digitstitch/Home/data/data_source/home_page_api_service.dart';
import 'package:digitstitch_app/features/digitstitch/Home/data/models/banner/banner_response_model.dart';
import 'package:digitstitch_app/features/digitstitch/Home/domain/repository/home_page_repository.dart';

class HomePageRepositoryImpl extends HomePageRepository{
  HomePageApi _homePageApi;
  HomePageRepositoryImpl(this._homePageApi);

  // get banners
  @override
  Future<List<BannerResponseModel>> getBanners() async {
    try{
      final response = await _homePageApi.getBanners();
      if(response != null){
        print("Hello world");
      }
      return response;
    } catch(e){
      print("error ${e.hashCode}");
      throw Exception("$e");
    }
  }

}