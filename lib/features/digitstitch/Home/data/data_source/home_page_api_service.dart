import 'package:digitstitch_app/features/digitstitch/Home/data/models/banner/banner_response_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../../../../../core/constants/constants.dart';
part 'home_page_api_service.g.dart';

@RestApi(baseUrl: DigitstitchApiBaseUrl)
abstract class HomePageApi{
  factory HomePageApi(Dio dio, {String baseUrl}) = _HomePageApi;

  @GET('banners')
  Future<List<BannerResponseModel>> getBanners();



}