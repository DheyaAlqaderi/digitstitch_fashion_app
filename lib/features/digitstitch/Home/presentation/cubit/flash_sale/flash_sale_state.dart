import 'package:digitstitch_app/features/digitstitch/Home/data/models/flash_sale/flash_sale_model.dart';

abstract class FlashSaleState {}

class InitFlashState extends FlashSaleState {}

class LoadingFlashState extends FlashSaleState {}

class SuccessFlashState extends FlashSaleState {
  final FlashSaleModel? flashSaleModel;
  final Duration duration;
  SuccessFlashState(this.flashSaleModel, this.duration);
}

class ErrorFlashState extends FlashSaleState {
  String error;
  ErrorFlashState(this.error);
}