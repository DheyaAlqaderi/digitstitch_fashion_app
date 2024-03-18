import 'package:digitstitch_app/features/digitstitch/Home/data/models/product/latest_product_model.dart';
import 'package:digitstitch_app/features/digitstitch/Home/data/models/product/product_model.dart';
import 'package:digitstitch_app/features/digitstitch/Home/domain/usecase/search/text/get_search_query_usecase.dart';
import 'package:digitstitch_app/features/digitstitch/Home/presentation/cubit/search/search_state.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class SearchQueryCubit extends Cubit<SearchQueryState> {
  SearchQueryCubit(this._getSearchQueryUseCase) : super(SearchQueryInitial());

  int page = 1;
  final GetSearchQueryUseCase _getSearchQueryUseCase;

  Future<void> searchQuery(String query) async {
    emit(SearchQueryLoading());
    try {

      final latestProduct = await _getSearchQueryUseCase.getSearchQuery(query,1);
      emit(SearchQueryLoaded(latestProduct));

    } catch (e) {
      emit(SearchQueryError(e.toString()));
    }

  }

}