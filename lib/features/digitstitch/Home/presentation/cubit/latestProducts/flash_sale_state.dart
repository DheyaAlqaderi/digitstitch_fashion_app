
import '../../../data/models/product/latest_product_model.dart';

abstract class LatestProductState {}

class InitLatestProductState extends LatestProductState {}

class LoadingLatestProductState extends LatestProductState {}

class SuccessLatestProductState extends LatestProductState {
  final LatestProductModel productModel;
  SuccessLatestProductState(this.productModel);
}

class ErrorLatestProductState extends LatestProductState {
  String error;
  ErrorLatestProductState(this.error);
}