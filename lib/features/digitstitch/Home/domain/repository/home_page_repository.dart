
import 'package:digitstitch_app/features/digitstitch/Home/data/models/banner/banner_response_model.dart';
import 'package:digitstitch_app/features/digitstitch/Home/data/models/category/category_model.dart';
import 'package:digitstitch_app/features/digitstitch/Home/data/models/flash_sale/flash_sale_model.dart';
import 'package:digitstitch_app/features/digitstitch/Home/data/models/product/product_model.dart';

import '../../data/models/product/latest_product_model.dart';

abstract class HomePageRepository{

  // get banners from API
  Future<List<BannerResponseModel>> getBanners();

  // get flash sale
  Future<FlashSaleModel> getFlashSaleProducts();

  // get categories
  Future<List<CategoryModel>> getCategory();

  // get products
  Future<LatestProductModel> getLatestProduct(int limit);

  // search by text
  Future<ProductModel> getSearchQuery({String query, int limit, int offset});

}
