import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:uno/uno.dart';
import 'package:value_notifier_studies/src/products/services/products_services.dart';

class UnoMock extends Mock implements Uno {}

class RequestMock extends Mock implements Request {}

void main() {
  final unoMock = UnoMock();
  final service = ProductService(unoMock);
  test('deve pegar todos os produtos', () async {
    when(() => unoMock.get(any())).thenAnswer((_) async => Response(
          headers: {},
          request: RequestMock(),
          status: 200,
          data: jsonResponse,
        ));
    final products = await service.fetchProducts();
    expect(products[0].title, 'Flutter 2');
  });
}

final jsonResponse = jsonDecode(
    r'''
[
        {
            "id": "0",
            "title": "Flutter 2"
        },
        {
            "id": "1",
            "title": "React Native"
        },
        {
            "title": "Ionic",
            "id": "2"
        }
]

''');
