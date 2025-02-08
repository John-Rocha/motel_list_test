import 'package:flutter_test/flutter_test.dart';
import 'package:motel_list_test/domain/entities/discount_entity.dart';

void main() {
  group('DiscountEntity', () {
    test('Should create a valid instance', () {
      const entity = DiscountEntity(desconto: 15.0);

      expect(entity.desconto, 15.0);
    });

    test('Should compare two instances correctly (Equatable)', () {
      const entity1 = DiscountEntity(desconto: 20.0);
      const entity2 = DiscountEntity(desconto: 20.0);
      const entity3 = DiscountEntity(desconto: 25.0);

      expect(entity1, equals(entity2));
      expect(entity1, isNot(equals(entity3)));
    });

    test('Should return the correct props', () {
      const entity = DiscountEntity(desconto: 30.0);

      expect(entity.props, [30.0]);
    });
  });
}
