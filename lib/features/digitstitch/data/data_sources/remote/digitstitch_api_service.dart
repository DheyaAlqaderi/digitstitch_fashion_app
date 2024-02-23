import 'dart:io';

import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';
import '../../../../../core/constants/constants.dart';
import '../../models/category_model.dart';
part 'digitstitch_api_service.g.dart';

@RestApi(baseUrl: DigitstitchApiBaseUrl)
abstract class DigitstitchApiService {
  factory DigitstitchApiService(Dio dio) = _DigitstitchApiService;

  @GET('/products')
  Future<List<CategoryModel>> getCategories();

}