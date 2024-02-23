import 'package:digitstitch_app/core/resources/data_state.dart';
import 'package:digitstitch_app/core/usecases/usecase.dart';
import 'package:digitstitch_app/features/digitstitch/domain/entities/category_entity.dart';
import 'package:digitstitch_app/features/digitstitch/domain/repository/digitstitch_repository.dart';

class GetCategoryUsecase implements UseCase<DataState<List<CategoryEntity>>, void> {
final DigitstitchRepository _digitstitchRepository;

GetCategoryUsecase(this._digitstitchRepository);

  @override
  Future<DataState<List<CategoryEntity>>> call({void params}) {
    return _digitstitchRepository.getCategories();
  }

}