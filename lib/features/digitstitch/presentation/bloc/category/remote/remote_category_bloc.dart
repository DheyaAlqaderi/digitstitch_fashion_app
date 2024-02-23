
import 'package:digitstitch_app/core/resources/data_state.dart';
import 'package:digitstitch_app/features/digitstitch/presentation/bloc/category/remote/remote_category_event.dart';
import 'package:digitstitch_app/features/digitstitch/presentation/bloc/category/remote/remote_category_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/usecases/get_category.dart';


class RemoteCategoryBloc extends Bloc<RemoteCategoryEvent, RemoteCategoryState>{

  final GetCategoryUsecase _categoryUsecase;
  RemoteCategoryBloc(this._categoryUsecase)
      : super(const RemoteCategoryLoading()){
   on <GetCategories> (onGetCategories);
  }

  Future<void> onGetCategories(GetCategories event, Emitter<RemoteCategoryState> emitter) async {
    final dataState = await _categoryUsecase();
    if(dataState is DataSuccess && dataState.data!.isNotEmpty){
      emit(
          RemoteCategoryDone(dataState.data!)
      );
    }

    if(dataState is DataFailed){
      print(dataState.error!.message);
      emit(
        RemoteCategoryError(dataState.error!)
      );

    }
  }
}