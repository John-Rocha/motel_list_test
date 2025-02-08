import 'package:flutter_test/flutter_test.dart';
import 'package:motel_list_test/domain/entities/item_suite_entity.dart';
import 'package:motel_list_test/data/models/item_suite_model.dart';

void main() {
  group('ItemSuiteModel', () {
    test('Should convert a valid JSON to an ItemSuiteEntity', () {
      final json = {
        'nome': 'Wi-Fi',
      };

      final itemSuite = ItemSuiteModel.fromJson(json);

      expect(itemSuite, isA<ItemSuiteEntity>());
      expect(itemSuite.nome, 'Wi-Fi');
    });

    test('Should throw an error when JSON is missing required fields', () {
      final json = <String, dynamic>{};

      expect(() => ItemSuiteModel.fromJson(json), throwsA(isA<TypeError>()));
    });

    test('Should return correct props', () {
      const itemSuite = ItemSuiteEntity(
        nome: 'Air Conditioning',
      );

      expect(itemSuite.props, ['Air Conditioning']);
    });
  });
}
