import 'package:flutter/material.dart';
import 'package:uno/uno.dart';
import 'package:value_notifier_studies/src/products/services/products_services.dart';
import 'package:value_notifier_studies/src/products/state/product_state.dart';
import 'package:value_notifier_studies/src/products/store/store_product.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final store = ProductStore(ProductService(Uno()));

  @override
  void initState() {
    super.initState();
    store.fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Prodct Page'),
      ),
      body: ValueListenableBuilder(
        valueListenable: store,
        builder: (_, state, child) {
          if (state is LoadingProductState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is ErrorProductState) {
            Center(
              child: Text(state.massage),
            );
          }
          if (state is SuccessProductState) {
            return ListView.builder(
                itemCount: state.products.length,
                itemBuilder: (_, index) {
                  final product = state.products[index];
                  return ListTile(
                    title: Text(product.title),
                  );
                });
          }
          if (state is InitialProductState) {
            const Text('inicial');
          }
          return Container();
        },
      ),
    );
  }
}
