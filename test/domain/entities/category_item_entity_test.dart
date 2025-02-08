import 'package:flutter_test/flutter_test.dart';
import 'package:motel_list_test/domain/entities/category_item_entity.dart';

void main() {
  group('CategoryItemEntity', () {
    test('Should create a valid instance', () {
      const entity = CategoryItemEntity(
        nome: 'Frigobar',
        icone: 'https://example.com/icon.png',
      );

      expect(entity.nome, 'Frigobar');
      expect(entity.icone, 'https://example.com/icon.png');
    });

    test('Should compare two instances correctly (Equatable)', () {
      const entity1 = CategoryItemEntity(
        nome: 'Wi-Fi',
        icone: 'https://example.com/wifi.png',
      );

      const entity2 = CategoryItemEntity(
        nome: 'Wi-Fi',
        icone: 'https://example.com/wifi.png',
      );

      const entity3 = CategoryItemEntity(
        nome: 'TV a cabo',
        icone: 'https://example.com/tv.png',
      );

      expect(entity1, equals(entity2));
      expect(entity1, isNot(equals(entity3)));
    });

    test('Should return the correct props', () {
      const entity = CategoryItemEntity(
        nome: 'Ar-Condicionado',
        icone: 'https://example.com/ac.png',
      );

      expect(entity.props, ['Ar-Condicionado', 'https://example.com/ac.png']);
    });
  });
}
