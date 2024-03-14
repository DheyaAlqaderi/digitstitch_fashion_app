import 'package:digitstitch_app/features/digitstitch/Home/data/models/banner/banner_response_model.dart';

abstract class BannersState {}

class InitBannersState extends BannersState {}

class LoadingBannersState extends BannersState {}

class SuccessBannersState extends BannersState {
  List<BannerResponseModel> bannerResponseModel;
  SuccessBannersState(this.bannerResponseModel);
}

class ErrorBannersState extends BannersState {
  String error;
  ErrorBannersState(this.error);
}