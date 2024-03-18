import 'package:digitstitch_app/features/digitstitch/Home/data/models/banner/banner_response_model.dart';
import 'package:digitstitch_app/features/digitstitch/Home/data/models/category/category_model.dart';
import 'package:digitstitch_app/features/digitstitch/Home/data/models/flash_sale/flash_sale_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../../../../../core/constants/constants.dart';
import '../models/product/latest_product_model.dart';
import '../models/product/product_filter_type_enum.dart';
import '../models/product/product_model.dart';
part 'home_page_api_service.g.dart';

@RestApi(baseUrl: DigitstitchApiBaseUrl)
abstract class HomePageApi{
  factory HomePageApi(Dio dio, {String baseUrl}) = _HomePageApi;

  @GET('banners')
  Future<List<BannerResponseModel>> getBanners();
  
  @GET('flash-sale')
  Future<FlashSaleModel> getFlashSaleProducts();

  @GET('categories')
  Future<List<CategoryModel>> getCategory();

  @GET('products/latest')
  Future<LatestProductModel> getLatestProductList(
      @Query("limit") int limit,
      );
  
  @GET('products/search')
  Future<ProductModel> getSearchQuery(
      @Query("name") String query,
      @Query("limit") int limit,
      @Query("offset") int offset,
      );



}