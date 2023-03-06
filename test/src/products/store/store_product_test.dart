import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:value_listenable_test/value_listenable_test.dart';
import 'package:value_notifier_studies/src/products/services/products_services.dart';
import 'package:value_notifier_studies/src/products/state/product_state.dart';
import 'package:value_notifier_studies/src/products/store/store_product.dart';

class ProductServiceMock extends Mock implements ProductService {}

void main() {
  final service = ProductServiceMock();
  final store = ProductStore(service);

  test('deve alterar estado para sucesso', () async {
    when(() => service.fetchProducts()).thenAnswer((_) async => []);

    expect(
      store,
      emitValues(
        [
          isA<LoadingProductState>(),
          isA<SuccessProductState>(),
          // isA<ErrorProductState>(),
        ],
      ),
    );
    await store.fetchProducts();
  });

  test('deve alterar estado para erro', () async {
    when(() => service.fetchProducts()).thenThrow(Exception('Error'));
    expect(
      store,
      emitValues(
        [
          isA<LoadingProductState>(),
          isA<ErrorProductState>(),
          // isA<ErrorProductState>(),
        ],
      ),
    );
    await store.fetchProducts();
  });
}
