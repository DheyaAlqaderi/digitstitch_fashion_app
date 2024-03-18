

import 'package:digitstitch_app/features/digitstitch/Home/domain/usecase/get_category/get_category_usecase.dart';
import 'package:digitstitch_app/features/digitstitch/Home/presentation/cubit/category/category_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryCubit extends Cubit<CategoryState>{
  final GetCategoryUseCase _getCategoryUseCase;

  CategoryCubit(this._getCategoryUseCase) : super(InitCategoryState());

  Future<void> getCategory() async {
    // Emit loading state
    emit(LoadingCategoryState());
    try {
      // Perform login operation
      final response = await _getCategoryUseCase.getCategory();
      // Emit success state with response data
      emit(SuccessCategoryState(response));
    } catch (e) {
      // Emit error state with error message
      emit(ErrorCategoryState(e.toString()));
    }
  }
}