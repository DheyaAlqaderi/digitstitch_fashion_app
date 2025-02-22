import 'package:digitstitch_app/features/digitstitch/product_and_reviews/presentation/cubit/product_details/product_details_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/usecase/get_product_details/get_product_details_usecase.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState>{
  final GetProductDetailsUseCase _getProductDetailsUseCase;

  ProductDetailsCubit(this._getProductDetailsUseCase) : super(InitProductDetailsState());

  Future<void> getProductDetails(int productId) async {
    // Emit loading state
    emit(LoadingProductDetailsState());
    try {
      // Perform login operation
      final response = await _getProductDetailsUseCase.getProductDetails(productId);
      // Emit success state with response data
      emit(SuccessProductDetailsState(response));
    } catch (e) {
      // Emit error state with error message
      emit(ErrorProductDetailsState(e.toString()));
    }
  }
}