import 'package:digitstitch_app/core/resources/data_state.dart';
import 'package:digitstitch_app/features/digitstitch/domain/entities/category_entity.dart';

abstract class DigitstitchRepository {

  Future<DataState<List<CategoryEntity>>> getCategories();
}