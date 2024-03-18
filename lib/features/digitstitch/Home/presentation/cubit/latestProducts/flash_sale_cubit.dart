
import 'package:digitstitch_app/features/digitstitch/Home/domain/usecase/get_latest_product/get_latest_product_usecase.dart';
import 'package:digitstitch_app/features/digitstitch/Home/presentation/cubit/latestProducts/flash_sale_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class LatestProductCubit extends Cubit<LatestProductState>{

  final GetLatestProductUseCase _getLatestProductUseCase;

  LatestProductCubit(this._getLatestProductUseCase) : super(LoadingLatestProductState());

  Future<void> fetchLatestProduct(int limit) async {
    emit(LoadingLatestProductState());
    try {
      final latestProduct = await _getLatestProductUseCase.getLatestProducts(limit);
      emit(SuccessLatestProductState(latestProduct));

    } catch (e) {
      emit(ErrorLatestProductState('Failed to fetch latest product'));
    }
  }


}