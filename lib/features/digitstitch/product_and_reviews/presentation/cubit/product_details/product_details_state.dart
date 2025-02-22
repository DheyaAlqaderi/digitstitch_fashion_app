import 'package:digitstitch_app/features/digitstitch/Home/data/models/product/product_details.dart';

abstract class ProductDetailsState {}

class InitProductDetailsState extends ProductDetailsState {}

class LoadingProductDetailsState extends ProductDetailsState {}

class SuccessProductDetailsState extends ProductDetailsState {
  ProductDetailsModel productDetailsModel;
  SuccessProductDetailsState(this.productDetailsModel);
}

class ErrorProductDetailsState extends ProductDetailsState {
  String error;
  ErrorProductDetailsState(this.error);
}