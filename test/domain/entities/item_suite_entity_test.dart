import 'package:flutter_test/flutter_test.dart';
import 'package:motel_list_test/domain/entities/item_suite_entity.dart';

void main() {
  group('ItemSuiteEntity', () {
    test('Should create a valid instance', () {
      const entity = ItemSuiteEntity(nome: 'TV a cabo');

      expect(entity.nome, 'TV a cabo');
    });

    test('Should compare two instances correctly (Equatable)', () {
      const entity1 = ItemSuiteEntity(nome: 'Wi-Fi');
      const entity2 = ItemSuiteEntity(nome: 'Wi-Fi');
      const entity3 = ItemSuiteEntity(nome: 'Ar-Condicionado');

      expect(entity1, equals(entity2));
      expect(entity1, isNot(equals(entity3)));
    });

    test('Should return the correct props', () {
      const entity = ItemSuiteEntity(nome: 'Frigobar');

      expect(entity.props, ['Frigobar']);
    });
  });
}
