import 'package:value_notifier_studies/src/products/model/product_model.dart';

abstract class ProductState {}

class InitialProductState extends ProductState {}

class LoadingProductState extends ProductState {}

class SuccessProductState extends ProductState {
  final List<ProductModel> products;
  SuccessProductState(this.products);
}

class ErrorProductState extends ProductState {
  final String massage;

  ErrorProductState(this.massage);
}
