import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uno/uno.dart';
import 'package:value_notifier_studies/src/products/product_page.dart';
import 'package:value_notifier_studies/src/products/services/products_services.dart';
import 'package:value_notifier_studies/src/products/store/store_product.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (_) => Uno()),
        Provider(create: (context) => ProductService(context.read())),
        ChangeNotifierProvider(
            create: (context) => ProductStore(context.read())),
      ],
      child: MaterialApp(
        title: 'ValueNotifier Sutides',
        theme: ThemeData(primaryColor: Colors.grey),
        home: const ProductPage(),
      ),
    );
  }
}
