
import 'package:digitstitch_app/core/common_models/api_response_model.dart';
import 'package:digitstitch_app/features/digitstitch/Home/data/data_source/home_page_api_service.dart';
import 'package:digitstitch_app/features/digitstitch/Home/data/models/banner/banner_response_model.dart';
import 'package:digitstitch_app/features/digitstitch/Home/data/models/category/category_model.dart';
import 'package:digitstitch_app/features/digitstitch/Home/data/models/flash_sale/flash_sale_model.dart';
import 'package:digitstitch_app/features/digitstitch/Home/data/models/product/product_details.dart';
import 'package:digitstitch_app/features/digitstitch/Home/data/models/product/product_model.dart';
import 'package:digitstitch_app/features/digitstitch/Home/domain/repository/home_page_repository.dart';
import 'package:flutter/foundation.dart';

import '../models/product/latest_product_model.dart';

class HomePageRepositoryImpl extends HomePageRepository{
  HomePageApi _homePageApi;
  HomePageRepositoryImpl(this._homePageApi);

  // get banners
  @override
  Future<List<BannerResponseModel>> getBanners() async {
    try{
      final response = await _homePageApi.getBanners();

        if (kDebugMode) {
          print("Hello world");
        }
      return response;
    } catch(e){
      print("error ${e.hashCode}");
      throw Exception("$e");
    }
  }

  @override
  Future<FlashSaleModel> getFlashSaleProducts() async{
    try{
      final response = await _homePageApi.getFlashSaleProducts();
      if (kDebugMode) {
        print("Hello world");
      }
      return response;
    } catch(e){
      print("error ${e.hashCode}");
      throw Exception("$e");
    }
  }

  @override
  Future<List<CategoryModel>> getCategory() async {
    try{
      final response = await _homePageApi.getCategory();
      if (kDebugMode) {
        print("Hello world");
      }
      return response;
    } catch(e){
      print("error ${e.hashCode}");
      throw Exception("$e");
    }
  }

  @override
  Future<LatestProductModel> getLatestProduct(int limit) async{
    try{
      final response = await _homePageApi.getLatestProductList(limit);
      if (kDebugMode) {
        print("Hello world");
      }
      return response;
    } catch(e){
      print("error ${e.hashCode}");
      throw Exception("$e");
    }
  }

  @override
  Future<ProductModel> getSearchQuery({String? query,   int? limit,  int? offset}) async {
    try{
      final response = await _homePageApi.getSearchQuery(query!, limit!, offset!);
      if (kDebugMode) {
        print("Hello world");
      }
      return response;
    } catch(e){
      print("error ${e.hashCode}");
      throw Exception("$e");
    }
  }

  @override
  Future<ProductDetailsModel> getProductDetails(int productId) async{
    try{
      final response = await _homePageApi.getProductDetails(productId);
      if (kDebugMode) {
        print("Hello world");
      }
      return response;
    } catch(e){
      print("error ${e.hashCode}");
      throw Exception("$e");
    }
  }

}