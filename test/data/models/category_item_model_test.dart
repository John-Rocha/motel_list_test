import 'package:flutter_test/flutter_test.dart';
import 'package:motel_list_test/domain/entities/category_item_entity.dart';
import 'package:motel_list_test/data/models/category_item_model.dart';

void main() {
  group('CategoryItemModel', () {
    test('Should convert a valid JSON to a CategoryItemEntity', () {
      final json = {
        'nome': 'Fridge',
        'icone': 'https://example.com/icon.png',
      };

      final categoryItem = CategoryItemModel.fromJson(json);

      expect(categoryItem, isA<CategoryItemEntity>());
      expect(categoryItem.nome, 'Fridge');
      expect(categoryItem.icone, 'https://example.com/icon.png');
    });

    test('Should throw an error when JSON is missing required fields', () {
      final json = {
        'nome': 'Fridge',
      };

      expect(() => CategoryItemModel.fromJson(json), throwsA(isA<TypeError>()));
    });

    test('Should return correct props', () {
      const categoryItem = CategoryItemEntity(
        nome: 'Fridge',
        icone: 'https://example.com/icon.png',
      );

      expect(categoryItem.props, ['Fridge', 'https://example.com/icon.png']);
    });
  });
}
