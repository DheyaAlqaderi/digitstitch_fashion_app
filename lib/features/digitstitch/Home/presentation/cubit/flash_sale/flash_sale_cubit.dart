import 'dart:async';

import 'package:digitstitch_app/features/digitstitch/Home/domain/usecase/get_flash_sale/get_flash_sale_usecase.dart';
import 'package:digitstitch_app/features/digitstitch/Home/presentation/cubit/flash_sale/flash_sale_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/flash_sale/flash_sale_model.dart';


class FlashSaleCubit extends Cubit<FlashSaleState>{
  late Timer timer;
  late FlashSaleModel flashSaleModel;
  final GetFlashStateUseCase _getFlashStateUseCase;

  FlashSaleCubit(this._getFlashStateUseCase) : super(LoadingFlashState());

  Future<void> fetchFlashSale() async {
    emit(LoadingFlashState());
    try {
      final flashSaleModel2 = await _getFlashStateUseCase.getFlashSales();
      if(flashSaleModel2 == null) {
        return;
      }
      flashSaleModel = flashSaleModel2;
      final endDate = flashSaleModel2.flashSale?.endDate;
      if (endDate != null) {
        final endDateTime = DateTime.parse(endDate);
        final duration = endDateTime.difference(DateTime.now());
        emit(SuccessFlashState(flashSaleModel2, duration));
        startTimer();
      } else {
        emit(ErrorFlashState(''));
      }
    } catch (e) {
      emit(ErrorFlashState('Failed to fetch flash sale data'));
    }
  }
  void startTimer() {
    const oneSec = Duration(seconds: 1);
    timer = Timer.periodic(
      oneSec,
          (Timer timer) {
        final duration = (state as SuccessFlashState).duration;
        final updatedDuration = duration - oneSec;
        emit(SuccessFlashState(flashSaleModel, updatedDuration));
        if (updatedDuration.inSeconds <= 0) {
          timer.cancel();
        }
      },
    );
  }

  @override
  Future<void> close() {
    timer.cancel();
    return super.close();
  }

}