import 'dart:io';
import 'package:dio/dio.dart';
import 'package:digitstitch_app/core/resources/data_state.dart';
import 'package:digitstitch_app/features/digitstitch/data/data_sources/remote/digitstitch_api_service.dart';
import 'package:digitstitch_app/features/digitstitch/data/models/category_model.dart';
import 'package:digitstitch_app/features/digitstitch/domain/repository/digitstitch_repository.dart';

class DigitstitchRepositoryImp implements DigitstitchRepository {
  final DigitstitchApiService _digitstitchApiService;
  DigitstitchRepositoryImp(this._digitstitchApiService);

  @override
  Future<DataState<List<CategoryModel>>> getCategories() async {
    try {
      final httpResponse = await _digitstitchApiService.getCategories();

      if (httpResponse == HttpStatus.ok) {
        return DataSuccess(httpResponse);
      } else {
        return DataFailed(
            DioError(
                error: httpResponse,
                requestOptions: RequestOptions(),
                type: DioErrorType.badResponse
            )
        );
      }
    } on DioError catch(e){
      return DataFailed(e);
    }
  }

}