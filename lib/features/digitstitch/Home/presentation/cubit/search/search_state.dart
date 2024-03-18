
import 'package:digitstitch_app/features/digitstitch/Home/data/models/product/product_model.dart';

abstract class SearchQueryState {}

class SearchQueryInitial extends SearchQueryState {}

class SearchQueryLoaded extends SearchQueryState {
  final ProductModel productModel;

  SearchQueryLoaded(this.productModel);
}

class SearchQueryLoading extends SearchQueryState {}

class SearchQueryError extends SearchQueryState {
  final String error;
  SearchQueryError(this.error);
}