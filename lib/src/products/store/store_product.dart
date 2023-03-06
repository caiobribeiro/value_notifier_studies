import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:value_notifier_studies/src/products/services/products_services.dart';
import 'package:value_notifier_studies/src/products/state/product_state.dart';

class ProductStore extends ValueNotifier<ProductState> {
  final ProductService service;

  ProductStore(this.service) : super(InitialProductState());

  Future fetchProducts() async {
    value = LoadingProductState();
    try {
      final products = await service.fetchProducts();
      value = SuccessProductState(products);
    } catch (e) {
      value = ErrorProductState(e.toString());
    }
  }
}
