import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:value_notifier_studies/src/products/state/product_state.dart';
import 'package:value_notifier_studies/src/products/store/store_product.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<ProductStore>().fetchProducts();
    });
  }

  @override
  Widget build(BuildContext context) {
    final store = context.watch<ProductStore>();
    final state = store.value;
    late Widget child;

    if (state is LoadingProductState) {
      child = const Center(
        child: CircularProgressIndicator(),
      );
    }
    if (state is ErrorProductState) {
      child = Center(
        child: Text(state.massage),
      );
    }
    if (state is SuccessProductState) {
      child = ListView.builder(
          itemCount: state.products.length,
          itemBuilder: (_, index) {
            final product = state.products[index];
            return ListTile(
              title: Text(product.title),
            );
          });
    }
    if (state is InitialProductState) {
      child = const Text('inicial');
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Prodct Page'),
      ),
      body: child,
    );
  }
}
