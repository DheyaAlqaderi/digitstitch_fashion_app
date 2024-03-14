import 'package:digitstitch_app/features/digitstitch/Home/domain/usecase/get_banners/get_banners_usecase.dart';
import 'package:digitstitch_app/features/digitstitch/Home/presentation/cubit/banners/banners_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BannerCubit extends Cubit<BannersState>{
  final GetBannersUseCase _getBannersUseCase;

  BannerCubit(this._getBannersUseCase) : super(InitBannersState());

  Future<void> getBanners() async {
    // Emit loading state
    emit(LoadingBannersState());
    try {
      // Perform login operation
      final response = await _getBannersUseCase.getBanners();
      // Emit success state with response data
      emit(SuccessBannersState(response));
    } catch (e) {
      // Emit error state with error message
      emit(ErrorBannersState(e.toString()));
    }
  }
}